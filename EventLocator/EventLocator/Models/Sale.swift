import Foundation
import SwiftUI

struct Sale: Codable, Hashable {
    let publics: Public
    let presales: [Presale]?
    
    private enum CodingKeys: String, CodingKey {
        case publics = "public"
        case presales
    }
}
