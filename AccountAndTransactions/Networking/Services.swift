//
//  Services.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

protocol CustomerInformationServicable {
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError>
}

class CustomerInformationService: CustomerInformationServicable {
    let customerDataRepository: CustomerDataRepository = CustomerDataRepositoryImplementation()
    
    func getCustomerInformation() async -> Result<CustomerDataModel, RequestError> {
        let result = await customerDataRepository.getCustomerInformation()
        return result
    }
}

