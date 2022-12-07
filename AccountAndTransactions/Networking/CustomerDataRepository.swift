//
//  CustomerDataRepository.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

protocol CustomerDataRepository {
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError>
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
}
