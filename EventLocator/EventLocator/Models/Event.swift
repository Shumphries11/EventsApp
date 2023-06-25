import Foundation
import SwiftUI

struct Event: Codable, Hashable {
    var name: String = ""
    var type: String = ""
    var id: String = ""
//    let test: Bool?
    var url: String? = ""
//    let locale: String
    var images: [Image]? = []
//    let distance: Double?
    var units: String? = ""
//    let sales: Sale?
    var dates: Date? = nil
    var classifications: [Classification]? = []
//    let promoter: Promoter?
//    let promoters: [Promoter]?
//    let pleaseNote: String?
    var priceRanges: [PriceRange]? = []
//    let products: [Product]?
//    let seatmap: Seatmap?
//    let accessibility: Accessibility?
//    let ticketLimit: TicketLimit?
//    let ageRestrictions: AgeRestriction?
//    let ticketing: Ticket?
    var links: Link? = nil
    var embedded: Embed? = nil

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case id
//        case test
        case url
//        case locale
        case images
//        case distance
        case units
//        case sales
        case dates
        case classifications
//        case promoter
//        case promoters
//        case pleaseNote
        case priceRanges
//        case products
//        case seatmap
//        case accessibility
//        case ticketLimit
//        case ageRestrictions
//        case ticketing
        case links = "_links"
        case embedded = "_embedded"
    }
}

