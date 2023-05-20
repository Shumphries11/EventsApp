import Foundation

struct Attraction: Codable, Hashable {
    let name: String
    let type: String
    let id: String
    let url: String
    let locale: String
    let externalLinks: ExternalLink?
    let aliases: [String]?
    let images: [Image]
    let classifications: [Classification]
    let upcomingEvents: UpcomingEvents?
    let links: Link

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case id
        case url
        case locale
        case externalLinks
        case aliases
        case images
        case classifications
        case upcomingEvents
        case links = "_links"
    }
}
