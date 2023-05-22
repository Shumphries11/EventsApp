import UIKit

final class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController = DetailViewController.instantiate(name: .detail)
    
    private weak var presenterController: UIViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(presenterController: UIViewController?) {
        self.init(navigationController: UINavigationController())
        self.presenterController = presenterController
    }
}

extension DetailCoordinator {
    func start() {
    }
}

