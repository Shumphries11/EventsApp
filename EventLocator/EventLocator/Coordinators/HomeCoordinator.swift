import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController = HomeViewController.instantiate(name: .home)
    
    private weak var presenterController: UIViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(presenterController: UIViewController?) {
        self.init(navigationController: UINavigationController())
        self.presenterController = presenterController
    }
}

extension HomeCoordinator {
    func start() {
    }
}
