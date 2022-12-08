//
//  AccountsView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import SwiftUI

struct AccountsView: View {
    @ObservedObject var accountsInteractor: AccountsInteractor
    
    init(accountsInteractor: AccountsInteractor) {
        self.accountsInteractor =  accountsInteractor
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { proxy in
                switch accountsInteractor.viewState {
                case .loading:
                    LoadingIndicator()
                case .display:
                    ZStack {
                        VStack {
                            
                            AccountHeader(customerInfoUIModel: accountsInteractor.customerInfoViewModel,
                                          parentSize: proxy.size)
                            
                            Text("Accounts")
                                .configureForHeaderText()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            AccountsListItem(
                                accountsInfoUIModelList: accountsInteractor.customerInfoViewModel.accounts)
                                .onAppear(perform: {
                                UITableView.appearance().contentInset.top = -20
                            })
                        }
                    }
                case .error(let error):
                    ErrorView(errorMessage: error)
                case .begin:
                    EmptyView()
                }
            }.navigationBarHidden(true)
        }
        .onAppear {
            accountsInteractor.viewDidLoad()
        }
    }
}

struct AccountsListItem: View {
    
    let accountsInfoUIModelList: [AccountsViewModel]
    
    var body: some View {
        List(accountsInfoUIModelList, id: \.id) {
            account in
            Navigator.navigate(
                route: .transactions(accountUniqueId: account.uniqueID)) {
                    Text(account.accountName)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .frame(height: 60, alignment: .leading)
                }
        }
    }
}

struct AccountHeader: View {
    private let backgroundOne = Color(red: 46/255, green: 19/255, blue: 113/255)
    private let backgroundTwo = Color(red: 19/255, green: 11/255, blue: 43/255)
    
    let customerInfoUIModel: CustomerInfoViewModel
    let parentSize: CGSize
    
    var body: some View {
        VStack {
            Text(customerInfoUIModel.customerName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            Text(customerInfoUIModel.numberOfAccounts)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
        }
        .frame(maxWidth: .infinity, maxHeight: parentSize.height * 0.21)
        .background {
            LinearGradient(gradient:
                            Gradient(colors: [backgroundOne, backgroundTwo]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(accountsInteractor: AccountsInteractor(
            customerInfoServicable: CustomerInformationService()))
    }
}
