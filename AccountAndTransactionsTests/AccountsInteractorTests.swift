//
//  AccountsInteractorTests.swift
//  AccountAndTransactionsTests
//
//  Created by Rakshith on 12/7/22.
//

import XCTest
@testable import AccountAndTransactions

class AccountsInteractorTests: XCTestCase {

    var accountsInteractor: AccountsInteractor!
    let mockedCustomerInformationService: CustomerInformationServicable = MockedCustomerInformationService()
    
    override func setUpWithError() throws {
        accountsInteractor =  AccountsInteractor(
            customerInfoServicable: mockedCustomerInformationService)
    }

    override func tearDownWithError() throws {
    }
    
    func testDidFetchCustomerInformation() async throws {
        await accountsInteractor.fetchCustomerDetails()
        XCTAssertTrue(accountsInteractor.viewState == .display)
        XCTAssertTrue(!accountsInteractor.customerInfoUIModel.accounts.isEmpty)
    }
    
    func testDidConfigureAccountInformation() async throws {
        await accountsInteractor.fetchCustomerDetails()
        let accountInfoUIModel = accountsInteractor.customerInfoUIModel.accounts
        XCTAssertEqual(accountInfoUIModel.count, 1)
    }
    
    func testDidHandleFetchError() async throws {
        let customerInformationFailableService: CustomerInformationServicable = MockedCustomerInformationServiceFailable()
        
        let interactor = AccountsInteractor(
            customerInfoServicable: customerInformationFailableService)
        
        await interactor.fetchCustomerDetails()
        XCTAssertEqual(interactor.viewState, .error(error: "Error while decoding"))
    }
}
