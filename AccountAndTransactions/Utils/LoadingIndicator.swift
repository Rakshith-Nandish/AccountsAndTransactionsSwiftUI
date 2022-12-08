//
//  LoadingIndicator.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/8/22.
//

import Foundation
import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
    }
}
