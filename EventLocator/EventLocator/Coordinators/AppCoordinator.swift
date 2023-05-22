import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init() {
        self.init(navigationController: UINavigationController())
    }
}

extension AppCoordinator {
    func start() {
        startMainFlow()
    }
}

private extension AppCoordinator {
    func startMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
        appendChildCoordinator(mainCoordinator)
    }
}
