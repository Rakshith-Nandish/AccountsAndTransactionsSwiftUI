//
//  Navigation.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation
import SwiftUI

enum NavigationRoute {
    case transactions(accountUniqueId: String)
}

struct Navigator {
    static func navigate<T: View>(route: NavigationRoute, content: () -> T) -> AnyView {
        switch route {
        case .transactions(let accountId):            
            return AnyView(
                NavigationLink(
                    destination: TransactionsViewConfigurator.getTransactionsView(
                        accountId: accountId)) {
                content()
            })
        }
    }
}

