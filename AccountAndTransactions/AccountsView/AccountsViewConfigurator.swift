//
//  AccountsViewConfigurator.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation

struct AccountsViewConfigurator {
    static func getAccountsView() -> AccountsView {
        let accountsInteractor = AccountsInteractor(
            customerInfoServicable: CustomerInformationService())
        return AccountsView(accountsInteractor: accountsInteractor)
    }
}
