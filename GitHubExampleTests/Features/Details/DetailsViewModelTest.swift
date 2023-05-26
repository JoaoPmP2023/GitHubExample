//
//  DetailsViewModelTest.swift
//  GitHubExampleTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import XCTest
@testable import GitHubExample

class DetailsViewModelTest: XCTestCase {
    
    let userSelectedIndex = 0
    
    func testViewDidLoad() {
        // Given
        let user = UserModelMock.getMock(many: 1)[userSelectedIndex]
        
        let viewModel = DetailsViewModel(user: user, service: UserServiceMock())
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 2
        
        
        viewModel.onDataSourceChanged = {
            expectation.fulfill()
        }
        
        viewModel.onReposChanged = {
            expectation.fulfill()
        }
        
        //When
        viewModel.viewDidLoad()
        
        //Then
        wait(for:[expectation], timeout:1)
        
    }
    
    func testViewDidLoad_WhenErrorOccours_ShouldCallOnDataSourceError() {
        // Given
        let user = UserModelMock.getMock(many: 1)[userSelectedIndex]
        
        let viewModel = DetailsViewModel(user: user, service: UserServiceMock(startWithError: true))
        let expectation = XCTestExpectation(description: "Did call onInformationLoad and DataSourceChanged")
        expectation.expectedFulfillmentCount = 2
        
        
        viewModel.onDataSourceError = {
            expectation.fulfill()
        }
        
        //When
        viewModel.viewDidLoad()
        
        //Then
        wait(for:[expectation], timeout:1)
        
    }
    
}
