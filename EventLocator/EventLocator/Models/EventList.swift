import Foundation
import SwiftUI


struct TicketMaster: Codable, Hashable {
    
    struct EventList: Codable, Hashable {
        let events: [Event]
    }
    
    
    let embedded: EventList
    
    private enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}


