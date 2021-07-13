
import Foundation

protocol HomeViewModelViewDelegate: AnyObject {
    func didFetchDataFromAPISuccess(sender: HomeViewModel)
    func didFetchDataFromAPIFail(sender: HomeViewModel)
}

class HomeViewModel {
    
    weak var coordinator:AppCoordinator?
    weak var delegate:HomeViewModelViewDelegate?
    lazy var service:HomeServiceProtocol = HomeService()
    var model:HomeModel? = HomeModel()
    
    var characters:[CharacterModel]? {
        get {
            return self.model?.characters
        }
    }
    
    let screenTitle = "Rick & Morty"
    
    func fetchData() {
        service.fetchData(from: self.model?.nextCharacterUrl ?? "https://rickandmortyapi.com/api/character") { (data, error) in
            
            guard error == nil else {
                self.delegate?.didFetchDataFromAPIFail(sender: self)
                return
            }
            
            self.model?.nextCharacterUrl = data?.info?.next
            
            if (self.model?.characters?.count ?? 0) == 0 {
                self.model?.characters = data?.results
            } else {
                if let data = data, let results = data.results {
                    self.model?.characters?.append(contentsOf: results)
                }
            }
            
            self.delegate?.didFetchDataFromAPISuccess(sender: self)
        }
    }
    
    func getCharacter(for row:Int) -> CharacterModel? {
        if let characters = self.model?.characters {
            var character = characters[row]
                   return character
        }
        
        return nil
    }
    
    func didSelectRow(at index: Int){
        if var character = getCharacter(for: index) {
                 self.coordinator?.showDetail(character: character)
        }
    }
    
}
