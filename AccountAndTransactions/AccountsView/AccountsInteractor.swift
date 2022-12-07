//
//  AccountsInteractor.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

enum AccountsViewState {
    case begin
    case loading
    case display
    case error(error: String)
}

class AccountsInteractor: ObservableObject {
    
    @Published var viewState: AccountsViewState = .begin
    
    var getCustomerInfoServicable: CustomerInformationServicable
    
    init(customerInfoServicable: CustomerInformationServicable) {
        self.getCustomerInfoServicable = customerInfoServicable
    }
    
    func viewDidLoad() {
        viewState = .begin
        Task {
            await fetchCustomerDetails()
        }
    }
    
    func fetchCustomerDetails() async {
        viewState = .loading
        let result = await getCustomerInfoServicable.getCustomerInformation()
        
        switch result {
        case .success(let model):
            configureCustomerInfoPresentationModel(customerInfoModel: model)
        case .failure(let error):
            viewState = .error(error: error.customMessage)
        }
    }
    
    func configureCustomerInfoPresentationModel(customerInfoModel: CustomerDataModel) {
        viewState = .display
        print(customerInfoModel)
    }
}
