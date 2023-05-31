import Foundation

struct NewEmbed: Codable, Hashable {
    let venues: [Venue]
    let attractions: [Attraction]
    let events: [Event]
    let products: [Event]
}


//struct NewVenue: Codable, Hashable {
//    let name: String
//    let type: String
//    let id: String
//    let url: String?
//    let locale: String
//    let aliases: [String]?
//    let images: [Image]?
//    let timezone: String
//    let city: City
//    let state: StateUS
//    let country: Country
//    let address: Address?
//    let location: Location
//    let upcomingEvents: UpcomingEvents
//    let links: Link
//
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case id
//        case url
//        case locale
//        case aliases
//        case images
//        case timezone
//        case city
//        case state
//        case country
//        case address
//        case location
//        case upcomingEvents
//        case links = "_links"
//    }
//}
//
//struct NewAttraction: Codable, Hashable {
//    let name: String
//    let type: String
//    let id: String
//    let url: String?
//    let locale: String
//    let images: [Image]?
//    let classifications: [Classification]?
//    let upcomingEvents: UpcomingEvents
//    let links: Link
//
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case id
//        case url
//        case locale
//        case images
//        case classifications
//        case upcomingEvents
//        case links = "_links"
//    }
//}
//
//struct NewEvent: Codable, Hashable {
//    let name: String
//    let type: String
//    let id: String
//    let url: String?
//    let locale: String
//    let images: [Image]?
//    let dates: Date?
//    let classifications: [Classification]?
//    let upcomingEvents: UpcomingEvents?
//    let links: Link
//    let embedded: SuggestEmbedded
//
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case id
//        case url
//        case locale
//        case images
//        case dates
//        case classifications
//        case upcomingEvents
//        case links = "_links"
//        case embedded = "_embedded"
//    }
//}

//struct SuggestEmbedded: Codable, Hashable {
//    let venues: [NewVenue]
//    let attractions: [Attraction]
//}
