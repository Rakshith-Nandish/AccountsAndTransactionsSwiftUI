//
//  CustomerDataRepository.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

protocol CustomerDataRepository {
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError>
    func getTransactionsInformation(accountId: String) async -> Result<[TransactionDetailDataModel], RequestError>
}

class CustomerDataRepositoryImplementation: CustomerDataRepository {
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError> {
        
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.url(forResource: "Accounts", withExtension: "txt") else {
            return .failure(.noResponse)
        }
        
        do {
            let data = try Data(contentsOf: path)
            
            if let decodedResponse = try? JSONDecoder().decode(CustomerDataModel.self, from: data) {
                return .success(decodedResponse)
            }
        } catch {
            return .failure(RequestError.decode)
            //fatalError("Failed to decode loaded JSON")
        }
        return .failure(RequestError.unknown)
    }
    
    func getTransactionsInformation(accountId: String) async -> Result<[TransactionDetailDataModel], RequestError> {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.url(forResource: "Accounts", withExtension: "txt") else {
            return .failure(.noResponse)
        }
        
        do {
            let data = try Data(contentsOf: path)
            
            if let decodedResponse = try? JSONDecoder().decode(CustomerDataModel.self, from: data) {
                //Ideally we would have an end point which returns transations for a particular account
                // This logic would not be required in this case.
                let accounts = decodedResponse.accounts.filter {
                    $0.uniqueID == accountId
                }
                guard let selectedAccount = accounts.first else {
                    return .failure(.noResponse)
                }
                return .success(selectedAccount.transactions)
            }
        } catch {
            return .failure(RequestError.decode)
            //fatalError("Failed to decode loaded JSON")
        }
        return .failure(RequestError.unknown)
    }
}
