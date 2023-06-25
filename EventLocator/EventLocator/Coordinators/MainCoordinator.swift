//import UIKit
//
//final class MainCoordinator: Coordinator {
//    var navigationController: UINavigationController
//    var childCoordinators: [Coordinator] = []
//    
//    private var tabBarController: UITabBarController?
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    convenience init() {
//        self.init(navigationController: UINavigationController())
//    }
//}
//
//extension MainCoordinator {
//    func start() {
//        showMainTabBarController()
//    }
//}
//
//private extension MainCoordinator {
//    func showMainTabBarController() {
//        let mainTabBarController = MainTabBarController()
//        let appearance = UITabBarAppearance()
//        appearance.backgroundColor = .clear
//        mainTabBarController.tabBar.standardAppearance = appearance
//        mainTabBarController.tabBar.clipsToBounds = false
//        
//        let homeCoordinator = HomeCoordinator(presenterController: mainTabBarController)
//        
//        homeCoordinator.viewController.tabBarItem.title = "Home"
//        homeCoordinator.viewController.tabBarItem.image = UIImage(systemName: "house.fill")
//        homeCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "house")
//        
////        let eventsCoordinator = EventsCoordinator(presenterController: mainTabBarController)
////
////        eventsCoordinator.viewController.tabBarItem.title = "Discover"
////        eventsCoordinator.viewController.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle.fill")
////        eventsCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle")
////
////        let detailCoordinator = DetailCoordinator(presenterController: mainTabBarController)
////
////        detailCoordinator.viewController.tabBarItem.title = "Detail"
////        detailCoordinator.viewController.tabBarItem.image = UIImage(systemName: "info.bubble.fill")
////        detailCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "info.bubble")
////
////        let ticketCoordinator = TicketCoordinator(presenterController: mainTabBarController)
////
////        ticketCoordinator.viewController.tabBarItem.title = "Ticket"
////        ticketCoordinator.viewController.tabBarItem.image = UIImage(systemName: "ticket.fill")
////        ticketCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "ticket")
//        
//        homeCoordinator.start()
////        eventsCoordinator.start()
////        detailCoordinator.start()
////        ticketCoordinator.start()
//
//        appendChildCoordinator(homeCoordinator)
////        appendChildCoordinator(eventsCoordinator)
////        appendChildCoordinator(detailCoordinator)
////        appendChildCoordinator(ticketCoordinator)
//        
//        mainTabBarController.viewControllers = [
//            homeCoordinator.viewController,
////            eventsCoordinator.viewController,
////            detailCoordinator.viewController,
////            ticketCoordinator.viewController
//        ]
//        
//        tabBarController = mainTabBarController
//        
//        navigationController.pushViewController(mainTabBarController, animated: true)
//        
//    }
//}
