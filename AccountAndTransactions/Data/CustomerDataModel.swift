//
//  CustomerDataModel.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

struct CustomerDataModel: Codable {
    let customerNameDetails: CustomerNameDetailDataModel
    let dateOfBirth: String
    let accounts: [AccountDetailDataModel]
}

struct CustomerNameDetailDataModel: Codable {
    let forename: String
    let surname: String
}
