import Foundation
import SwiftUI

struct Event: Codable, Hashable {
    let name: String
    let type: String
    let id: String
    let test: Bool?
    let url: String?
    let locale: String
    let images: [Image]
    let distance: Double?
    let units: String?
    let sales: Sale?
    let dates: Date?
    let clasifications: [Classification]?
    let promoter: Promoter?
    let promoters: [Promoter]?
    let pleaseNote: String?
    let priceRanges: [PriceRange]?
    let products: [Product]?
    let seatmap: Seatmap?
    let accessibility: Accessibility?
    let ticketLimit: TicketLimit?
    let ageRestrictions: AgeRestriction?
    let ticketing: Ticket?
    let links: Link
    let embedded: Embed
    
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case id
        case test
        case url
        case locale
        case images
        case distance
        case units
        case sales
        case dates
        case clasifications
        case promoter
        case promoters
        case pleaseNote
        case priceRanges
        case products
        case seatmap
        case accessibility
        case ticketLimit
        case ageRestrictions
        case ticketing
        case links = "_links"
        case embedded = "_embedded"
    }
}

