import Foundation
import UIKit


protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    init(navigationController: UINavigationController)
    
    func start()
    func finish()
    
    func appendChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
    }
    
    func appendChildCoordinator(_ coordinator: Coordinator) {
        if childCoordinators.firstIndex(where: { $0 === coordinator }) == nil {
            childCoordinators.append(coordinator)
        }
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func removeAllCoordinators() {
        childCoordinators.removeAll()
    }
    
}
