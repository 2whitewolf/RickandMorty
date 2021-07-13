
import Foundation

protocol DetailViewModelViewDelegate:AnyObject {
    
}

class DetailViewModel: DetailViewModelViewDelegate {
    
    var model:CharacterModel?
    
    init(character:CharacterModel) {
        self.model = character
    }
}
