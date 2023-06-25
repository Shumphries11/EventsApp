//import Foundation
//import UIKit
//
//protocol Storyboarded {
//    static func instantiate(name: UIStoryboard.Storyboard) -> Self
//}
//
//extension UIStoryboard {
//    enum Storyboard: String {
//        case home = "Main"
////        case events = "Events"
////        case detail = "EventDetail"
////        case ticket = "Ticket"
//    
//        var id: String {
//            return rawValue
//        }
//    }
//}
//
//extension Storyboarded where Self: UIViewController {
//    static func instantiate(name: UIStoryboard.Storyboard) -> Self {
//        let full = NSStringFromClass(self)
//        
//        let storyboard = UIStoryboard(name: name.id, bundle: nil)
//        let className = full.components(separatedBy: ".")[1]
//        
//        return storyboard.instantiateViewController(withIdentifier: className) as! Self
//    }
//}
