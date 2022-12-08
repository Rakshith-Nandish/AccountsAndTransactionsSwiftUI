//
//  AccountsInteractor.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

enum AccountsViewState: Equatable {
    case begin
    case loading
    case display
    case error(error: String)
}

class AccountsInteractor: ObservableObject {
    
    @Published var viewState: AccountsViewState = .begin
    
    var customerInfoViewModel: CustomerInfoViewModel!
    
    var getCustomerInfoServicable: CustomerInformationServicable
    
    init(customerInfoServicable: CustomerInformationServicable) {
        self.getCustomerInfoServicable = customerInfoServicable
    }
    
    func viewDidLoad() {
        viewState = .loading
        Task {
            await fetchCustomerDetails()
        }
    }
    
    func fetchCustomerDetails() async {
        let result = await getCustomerInfoServicable.getCustomerInformation()
        
        switch result {
        case .success(let model):
            await configureCustomerInfoPresentationModel(customerInfoModel: model)
        case .failure(let error):
            await configureErrorState(error: error)
        }
    }
    
    @MainActor
    func configureCustomerInfoPresentationModel(customerInfoModel: CustomerDataModel) {
        print(customerInfoModel)
        let accountsUIModelList = customerInfoModel.accounts.map {
            AccountsViewModel(id: $0.sortingOrder,
                            uniqueID: $0.uniqueID,
                            accountName: $0.accountName,
                            numberOfCards: $0.cards.count)
        }
        let customerWelcomeText = "Welcome " + customerInfoModel.customerNameDetails.forename + " " +
        customerInfoModel.customerNameDetails.surname
        
        let numberOfAccountsText = "Number of Accounts: " + String(accountsUIModelList.count)
        
        customerInfoViewModel = CustomerInfoViewModel(
            customerName: customerWelcomeText,
            numberOfAccounts: numberOfAccountsText,
            accounts: accountsUIModelList)
        viewState = .display
    }
    
    @MainActor
    func configureErrorState(error: RequestError) {
        viewState = .error(error: error.customMessage)
    }
}
