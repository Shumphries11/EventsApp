import Foundation
import SwiftUI

struct Image: Codable, Hashable {
    let ratio: String?
    let url: String
    let width: Int
    let height: Int
    let fallback: Bool
    
}
