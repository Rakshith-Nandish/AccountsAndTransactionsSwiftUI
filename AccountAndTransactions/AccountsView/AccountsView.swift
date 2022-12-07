//
//  AccountsView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import SwiftUI

struct AccountsView: View {
    
    let backgroundOne = Color(red: 46/255, green: 19/255, blue: 113/255)
    let backgroundTwo = Color(red: 19/255, green: 11/255, blue: 43/255)
    
    @ObservedObject var accountsInteractor: AccountsInteractor
    
    init(accountsInteractor: AccountsInteractor) {
        self.accountsInteractor =  accountsInteractor
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { proxy in
                if case .loading = accountsInteractor.viewState {
                    getLoader()
                }
                else if case .display = accountsInteractor.viewState {
                    ZStack {
                        VStack {
                             
                            getHeader(size: proxy.size)
                            
                            Text("Accounts")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            List(accountsInteractor.customerInfoUIModel.accounts, id: \.id) {
                                account in
                                Text(account.accountName)
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .frame(height: 60, alignment: .leading)
                            }.onAppear(perform: {
                                UITableView.appearance().contentInset.top = -20
                            })
                        }
                    }
                }
            }.navigationBarHidden(true)
        }
        .onAppear {
            accountsInteractor.viewDidLoad()
        }
    }
    
    private func getHeader(size: CGSize) -> some View {
        VStack {
            Text(accountsInteractor.customerInfoUIModel.customerName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            Text("Number of accounts: 3")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
        }
        .frame(maxWidth: .infinity, maxHeight: size.height * 0.21)
        .background {
            LinearGradient(gradient:
                            Gradient(colors: [backgroundOne, backgroundTwo]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
    }
    
    private func getLoader() -> some View {
        ProgressView()
            .scaleEffect(1, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
    }
}
    
struct AccountsView_Previews: PreviewProvider {
        static var previews: some View {
            AccountsView(accountsInteractor: AccountsInteractor(
                customerInfoServicable: CustomerInformationService()))
        }
}
