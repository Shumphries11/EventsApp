import Foundation

struct Suggest: Codable, Hashable {
    let links: Link
    let embedded: NewEmbed
    
    private enum CodingKeys: String, CodingKey {
        case links = "_links"
        case embedded = "_embedded"
    }
}
