//
//  HomeViewModelTests.swift
//  GitHubExampleTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import XCTest
@testable import GitHubExample

class HomeViewModelTests: XCTestCase {
    
    let indexSelected = 0
    
    func testViewDidLoad() {
        // Given
        let viewModel = HomeViewModel(service: UserServiceMock())
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 3
        
        viewModel.onInformationLoading = { _ in
            expectation.fulfill()
        }
        
        viewModel.onDataSourceChanged = {
            expectation.fulfill()
        }
        
        //When
        viewModel.viewDidLoad()
        
        //Then
        wait(for:[expectation], timeout:1)
        
    }
    
    func testViewDidLoad_WhenDataSourceIsEmpty_ShouldCallOnDataSourceEmpty() {
        // Given
        let viewModel = HomeViewModel(service: UserServiceMock(startWithEmpty: true))
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 3
        
        viewModel.onInformationLoading = { _ in
            expectation.fulfill()
        }
        
        viewModel.onDataSourceEmpty = {
            expectation.fulfill()
        }
        
        //When
        viewModel.viewDidLoad()
        
        //Then
        wait(for:[expectation], timeout:1)
        
    }
    
    
    func testViewDidLoad_WhenDataSourceHasError_ShouldCallOnDataSourceError() {
        // Given
        let viewModel = HomeViewModel(service: UserServiceMock(startWithError: true))
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 3
        
        viewModel.onInformationLoading = { _ in
            expectation.fulfill()
        }
        
        viewModel.onDataSourceError = {
            expectation.fulfill()
        }
        
        //When
        viewModel.viewDidLoad()
        
        //Then
        wait(for:[expectation], timeout:1)
        
    }
    
    func testSelectRow_ShouldCallGoToDetails() {
        
        // Given
        let viewModel = HomeViewModel(service: UserServiceMock(startWithError: true), dataSource: UserModelMock.getMock(many: 10))
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 1
        let user = viewModel.getUser(row: indexSelected)
        
        
        viewModel.onGoToDetails = { u in
            
            XCTAssertTrue(user.login == u.login)
            expectation.fulfill()
        }
        
        //When
        viewModel.didSelectRow(row: indexSelected)
        
        //Then
        wait(for:[expectation], timeout:1)
    }
}
