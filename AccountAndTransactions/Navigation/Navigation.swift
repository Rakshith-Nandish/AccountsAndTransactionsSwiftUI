//
//  Navigation.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation
import SwiftUI

enum NavigationRoute {
    case transactions
}

struct Navigator {
    static func navigate<T: View>(route: NavigationRoute, content: () -> T) -> AnyView {
        switch route {
        case .transactions:
//            let getAllQuotesService = GetAuthorQuoteService()
//            let getCharacterDetailService = GetCharacterDetailService()
//
//            let viewInteractor = CharacterDetailViewInteractor(selectedCharacterUIModel: characterUIModel, getAllQuotesService: getAllQuotesService, getCharacterDetailService: getCharacterDetailService)
            return AnyView(
                NavigationLink(destination: TransactionsView()) {
                content()
            })
        }
    }
}

