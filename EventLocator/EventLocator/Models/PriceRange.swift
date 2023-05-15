import Foundation

struct PriceRange: Codable, Hashable {
    let type: String
    let currency: String
    let min: Double
    let max: Double
}
