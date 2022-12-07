//
//  AccountDataModel.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation


struct AccountDetailDataModel: Codable {
    let accountName: String
    let sortingOrder: Int
    let uniqueID: String
    let transactions: [TransactionDetailDataModel]
    let cards: [CardsDataModel]
}
