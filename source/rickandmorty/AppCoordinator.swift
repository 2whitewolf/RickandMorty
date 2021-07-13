
import Foundation
import UIKit

protocol CoordinatorProtocol {
    var window: UIWindow { get }
    var navigationController:UINavigationController? { get }
    func start()
}

class AppCoordinator:CoordinatorProtocol {
    
    var window: UIWindow
    var navigationController: UINavigationController?
    let transition = TransitionCoordinator()
    
    init(window: UIWindow) {
        self.window = window
        
    }
    
    func start() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let homeViewController = HomeTableViewController(viewModel: viewModel)
        viewModel.delegate = homeViewController
        self.navigationController = UINavigationController(rootViewController: homeViewController)
        self.navigationController?.delegate = transition
        self.window.rootViewController = self.navigationController
    }
    
    func showDetail(character:CharacterModel){
        let viewModel = DetailViewModel(character: character)
        let detailViewController = DetailViewController(viewModel: viewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}
