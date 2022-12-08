//
//  CustomerInfoUIModel.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation

struct CustomerInfoViewModel {
    let customerName: String
    let numberOfAccounts: String
    let accounts: [AccountsViewModel]
}

struct AccountsViewModel {
    let id: Int
    let uniqueID: String
    let accountName: String
    let numberOfCards: Int
}
