//
//  HeaderView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation
import SwiftUI

struct HeaderView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.black)
    }
}

extension Text {
    func configureForHeaderText() -> some View {
        self.fontWeight(.bold)
            .modifier(HeaderView())
            .padding(.leading,10)
    }
}
