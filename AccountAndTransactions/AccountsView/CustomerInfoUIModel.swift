//
//  CustomerInfoUIModel.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation

struct CustomerInfoUIModel {
    let customerName: String
    let numberOfAccounts: String
    let accounts: [AccountsUIModel]
}

struct AccountsUIModel {
    let id: Int
    let accountName: String
    let numberOfCards: Int
}
