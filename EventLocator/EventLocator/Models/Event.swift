import Foundation
import SwiftUI

struct Event: Codable, Hashable {
    var name: String = ""
    var type: String = ""
    var id: String = ""
    var url: String? = ""
    var images: [Image]? = []
    var units: String? = ""
    var dates: Date? = nil
    var classifications: [Classification]? = []
    var priceRanges: [PriceRange]? = []
    var links: Link? = nil
    var embedded: Embed? = nil

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case id
        case url
        case images
        case units
        case dates
        case classifications
        case priceRanges
        case links = "_links"
        case embedded = "_embedded"
    }
}

