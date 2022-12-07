//
//  TransacationDetailDataModel.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

struct TransactionDetailDataModel: Codable {
    let date: String
    let inAmount: String
    let outAmount: String
    let paymentType: String
    let title: String
}
