//
//  AccountsView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import SwiftUI

struct AccountsView: View {
    
    private var accountsInteractor: AccountsInteractor
    
    init(accountsInteractor: AccountsInteractor) {
        self.accountsInteractor =  accountsInteractor
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Welcome Customer Name!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("Date Of Birth")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .onAppear {
            accountsInteractor.viewDidLoad()
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(accountsInteractor: AccountsInteractor(
            customerInfoServicable: CustomerInformationService()))
    }
}
