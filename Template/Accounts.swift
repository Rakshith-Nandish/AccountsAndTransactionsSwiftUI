//
//  Accounts.swift
//

import Foundation

struct Account {

    let cards: [Card]?
    let transactions: [Transaction]
    let uniqueID: String

}

struct Card {

    let applePayEligible: Bool
    let cardToken: String

}

struct Transaction {

    let paymentType: PaymentType
    let uniqueID: String

}

enum PaymentType {

    case CreditTransaction
    case DebitTransaction
    case DirectDebit

}
