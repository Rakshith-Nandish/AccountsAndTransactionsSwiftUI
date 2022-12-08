//
//  ErrorView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/8/22.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        Text("Looks like something went wrong!!" + errorMessage)
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
    }
}
