import Foundation

struct Product: Codable, Hashable {
    let name: String
    let id: String
    let url: String
    let type: String
    let classifications: [Classification]
}
