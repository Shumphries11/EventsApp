import Foundation

struct Link: Codable, Hashable {
    let link: AttractionLink
    let attractions: [AttractionLink]
    let venues: [AttractionLink]
    
    private enum CodingKeys: String, CodingKey {
        case link = "self"
        case attractions
        case venues
    }
}
