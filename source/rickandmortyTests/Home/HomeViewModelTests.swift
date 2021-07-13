
import XCTest
@testable import rickandmorty

class HomeViewModelTests:XCTestCase {
    
    var viewModel:HomeViewModel!
    
    override func setUp() {
        viewModel = HomeViewModel()
        viewModel.service = HomeServiceSuccessMock()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testFetchData() {
        let expectation = self.expectation(description: "fetchData")
        viewModel.fetchData()
        expectation.fulfill()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(viewModel.characters)
    }
    
    func testLoadMoreCharacters(){
        let expectation = self.expectation(description: "fetchData")
        viewModel.fetchData()
        let count = viewModel.characters!.count
        viewModel.fetchData()
        expectation.fulfill()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertTrue(viewModel.characters!.count > count)
    }
    
}
