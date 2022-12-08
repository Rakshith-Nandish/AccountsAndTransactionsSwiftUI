//
//  MockedServices.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/7/22.
//

import Foundation

final class MockedCustomerInformationService: CustomerInformationServicable, Mockable {
    
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError> {
        let result = loadJSON(filename: "CustomerInformationMock", type: CustomerDataModel.self)
        if let result = result {
            return .success(result)
        }
        return .failure(.invalidURL)
    }
}

final class MockedCustomerInformationServiceFailable: CustomerInformationServicable, Mockable {
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError> {
        return .failure(.decode)
    }
}

//This can be done similarly for the TransactionInformationServices
