
import XCTest
@testable import rickandmorty

class DetailViewModelTests:XCTestCase {
    
    var viewModel:DetailViewModel!
    
    override func setUp() {
        
        let character = CharacterModel(id: 121, name: "Eyehole Man", status: "Alive", species: "Alien", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/121.jpeg", url: "https://rickandmortyapi.com/api/character/121", origin: LocationModel(id: nil, name: "Unknown", url: "", type: nil, dimension: nil, residents: nil), location: LocationModel(id: nil, name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6", type: nil, dimension: nil, residents: nil), episode: ["https://rickandmortyapi.com/api/episode/19"], isFavorited: nil)
        
        viewModel = DetailViewModel(character: character)
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testFavoriteCharacter(){
        viewModel.toggleFavoriteCharacter()
        XCTAssertTrue(viewModel.model!.isFavorited!)
    }
    
    func testUnfavoriteCharacter(){
        viewModel.toggleFavoriteCharacter()
        viewModel.toggleFavoriteCharacter()
        XCTAssertFalse(viewModel.model!.isFavorited!)
    }
}
