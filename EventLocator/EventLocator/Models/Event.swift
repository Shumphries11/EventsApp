import Foundation


struct Event: Hashable {
    let id = UUID()
    let title: String
    let eventDate: String
    let image: String
    
    init(title: String = "", eventDate: String = "", image: String = "") {
        
        self.title = title
        self.eventDate = eventDate
        self.image = image
    }
}
