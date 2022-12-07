//
//  TransactionsInteractor.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation

enum TransactionsState {
    case begin
    case loading
    case display
    case error(String)
}

class TransactionInteractor: ObservableObject {
    
    var transactionsInformationServicable: TransactionsInformationServicable
    var accountId: String
    
    @Published var viewState: TransactionsState = .begin
    
    var transactionsUIModelList: [TransactionsUIModel] = []
    
    init(transactionInfoServicable: TransactionsInformationServicable,
         accountId: String) {
        transactionsInformationServicable = transactionInfoServicable
        self.accountId = accountId
    }
    
    func viewDidLoad() {
        viewState = .loading
        Task {
            await fetchTransactionsInformation()
        }
    }
    
    func fetchTransactionsInformation() async {
        guard !accountId.isEmpty else {
            //error
            await configureErrorForTransactionFetch(error: .unauthorized)
            return
        }
        let result = await transactionsInformationServicable.getTransactionDetailsForAccount(id: accountId)
        
        switch result {
        case .success(let model):
            await configureTransactionUIModel(transactions: model)
        case .failure(let error):
            await configureErrorForTransactionFetch(error: error)
        }
    }
    
    @MainActor
    func configureTransactionUIModel(transactions: [TransactionDetailDataModel]) {
        print(transactions)
        transactionsUIModelList = transactions.map {
            
            TransactionsUIModel(id: $0.uniqueID,
                                title: $0.title,
                                amount: $0.inAmount,
                                type: $0.paymentType,
                                date: $0.date)
        }
        viewState = .display
    }
    
    @MainActor
    func configureErrorForTransactionFetch(error: RequestError) {
        viewState = .error(error.customMessage)
    }
}
