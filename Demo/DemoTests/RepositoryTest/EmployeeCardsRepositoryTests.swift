//
//  EmployeeCardsRepositoryTests.swift
//  DemoTests
//
//  Created by MohammadHossan on 01/04/2024.
//

import XCTest
@testable import Demo

final class EmployeeCardsRepositoryTests: XCTestCase {
    
    var fakeNetworkManager: FakeNetworkManager!
    var employeeCardsRepository: EmployeeCardsRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fakeNetworkManager = FakeNetworkManager()
        employeeCardsRepository = EmployeeRepositoryImplementation (networkManager: fakeNetworkManager)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        employeeCardsRepository = nil
        
    }
    
    // when passes Employee list array will return with some data
    func test_Get_Employee_List_In_Success_Case() async {
        
        // GIVEN
        guard let url = URL(string: "EmployeeCardsResponse") else {
            XCTFail("URL not found")
            return
        }
        
        let lists = try? await employeeCardsRepository.getEmployeeList(for: url)
        // WHEN
        guard let listItem = lists else {
            XCTFail("List is nil")
            return
        }
        
        //THEN
        XCTAssertNotNil(listItem)
        XCTAssertTrue(listItem.employees.count > 0)
        XCTAssertEqual(listItem.employees.count, 11)
        XCTAssertEqual(listItem.employees.first?.fullName, "Justine Mason")
    }
    
    // When  Employee list is empty.
    func test_Get_Employee_List_In_Failure_Case() async {
        
        // GIVEN
        guard let url = URL(string: "EmployeeCardsResponseAPIFailed") else {
            XCTFail("URL not found")
            return
        }
        
        let lists = try? await employeeCardsRepository.getEmployeeList(for: url)
        
        //THEN
        XCTAssertNil(lists)
    }
}
