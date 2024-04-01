//
//  EmployeeListViewModelTest.swift
//  DemoTests
//
//  Created by MohammadHossan on 01/04/2024.
//

import XCTest
@testable import Demo

final class EmployeeListViewModelTest: XCTestCase {

    var fakeEmployeeCardsRepository: FakeEmployeeCardsRepository!
    var employeeListViewModel: EmployeeListViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fakeEmployeeCardsRepository = FakeEmployeeCardsRepository()
        employeeListViewModel = EmployeeListViewModel(repository: fakeEmployeeCardsRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fakeEmployeeCardsRepository = nil
        employeeListViewModel = nil
    }
    
    // when url is correct, should have some data in Employee List
    func test_getEmployeeList_When_URL_Is_Correct() async {
        
        // GIVEN
        await employeeListViewModel.getEmployeeList(urlStr: "EmployeeCardsResponse")
        
        // WHEN
        let employeeList =  await employeeListViewModel.employeeLists
        
        // THEN
        // checking records count and employee note on success
        XCTAssertNotNil(employeeList)
        XCTAssertEqual(employeeList.count, 11)
        XCTAssertEqual(employeeList.first?.fullName, "Justine Mason")
        XCTAssertEqual(employeeList.first?.phoneNumber, "5553280123")

        // Error will be nil when api is success
        let error =  await employeeListViewModel.customError
        XCTAssertNil(error)
    }
}
