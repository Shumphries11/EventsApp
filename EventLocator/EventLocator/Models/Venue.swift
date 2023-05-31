import Foundation

struct Venue: Codable, Hashable {
    let name: String
    let type: String
    let id: String
    let test: Bool?
    let url: String?
    let locale: String
    let aliases: [String]?
    let images: [Image]?
    let distance: Double?
    let units: String?
    let postalCode: String?
    let timezone: String
    let city: City
    let state: StateUS
    let country: Country
    let address: Address
    let location: Location
    let markets: [Market]?
    let dmas: [DMAS]?
    let social: Social?
    let boxOfficeInfo: BoxOffice?
    let parkingDetail: String?
    let accessibleSeatingDetail: String?
    let generalInfo: Info?
    let upcomingEvents: UpcomingEvents?
    let links: Link

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case id
        case test
        case url
        case locale
        case aliases
        case images
        case distance
        case units
        case postalCode
        case timezone
        case city
        case state
        case country
        case address
        case location
        case markets
        case dmas
        case social
        case boxOfficeInfo
        case parkingDetail
        case accessibleSeatingDetail
        case generalInfo
        case upcomingEvents
        case links = "_links"
    }
}
