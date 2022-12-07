//
//  TransactionsView.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import SwiftUI

struct TransactionsView: View {
    
    @ObservedObject var transactionInteractor: TransactionInteractor
    
    init(transactionInteractor: TransactionInteractor) {
        self.transactionInteractor = transactionInteractor
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if case .loading = transactionInteractor.viewState {
                    //Display loader
                }
                else if case .display = transactionInteractor.viewState {
                    VStack {
                        Text("Transactions")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.leading, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        List(transactionInteractor.transactionsUIModelList, id: \.id) {
                            transaction in
                            HStack {
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Title")
                                    Text("Type")
                                }
                                .padding([.top, .bottom], 10)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text("Amount")
                                    Text("Date")
                                }
                                .padding([.top, .bottom], 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .onAppear {
            transactionInteractor.viewDidLoad()
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(transactionInteractor: TransactionInteractor(transactionInfoServicable: TransactionInformationService(), accountId: ""))
    }
}
