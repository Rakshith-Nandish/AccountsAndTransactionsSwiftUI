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
        ZStack {
            switch transactionInteractor.viewState {
                
            case .loading:
                LoadingIndicator()
                
            case .display:
                VStack {
                    Text("Transactions")
                        .configureForHeaderText()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    List(transactionInteractor.transactionsViewModelList, id: \.id) {
                        transaction in
                        TransactionListItem(transactionsUIModel: transaction)
                    }
                }
            case .begin:
                EmptyView()
                
            case .error(let errorMessage):
                ErrorView(errorMessage: errorMessage)
            }
        }.onAppear {
            transactionInteractor.viewDidLoad()
        }
    }
}

struct TransactionListItem: View {
    let transactionsUIModel: TransactionsViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                Text(transactionsUIModel.title)
                    .configureBodyFontAndBold()
                
                Text(transactionsUIModel.type)
                    .font(.caption)
            }
            .padding([.top, .bottom], 10)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 10) {
                Text(transactionsUIModel.amount)
                    .configureBodyFontAndBold()
                
                Text(transactionsUIModel.date)
                    .font(.caption)
            }
            .padding([.top, .bottom], 10)
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(transactionInteractor: TransactionInteractor(transactionInfoServicable: TransactionInformationService(), accountId: ""))
    }
}
