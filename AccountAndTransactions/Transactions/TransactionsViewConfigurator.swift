//
//  TransactionsViewConfigurator.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/8/22.
//

import Foundation
struct TransactionsViewConfigurator {
    static func getTransactionsView(accountId: String) -> TransactionsView {
        let transactionInformationService: TransactionsInformationServicable =
        TransactionInformationService()
        
        let transactionInteractor = TransactionInteractor(
            transactionInfoServicable: transactionInformationService,
            accountId: accountId)
        
        return TransactionsView(transactionInteractor: transactionInteractor)
    }
}
