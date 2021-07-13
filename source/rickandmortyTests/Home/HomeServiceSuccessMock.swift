
import Foundation
@testable import rickandmorty

class HomeServiceSuccessMock:HomeServiceProtocol {
    func fetchData(from url: String, completionHandler: @escaping (RequestModel<CharacterModel>?, String?) -> Void) {
        
        let result = RequestModel(info: RequestInfo(count: 10, pages: 2, next: nil, prev: nil), results: [
            CharacterModel(id: 1, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 2, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 3, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 4, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 5, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 6, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 7, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 8, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 9, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true),
            CharacterModel(id: 10, name: "character 1", status: "Alive", species: "Human", type: "", gender: "Male", image: nil, url: "", origin: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), location: LocationModel(id: 1, name: "Earth", url: nil, type: "", dimension: "dimension", residents: nil), episode: nil, isFavorited: true)
        ])
        
        completionHandler(result, nil)
    }
    
}
