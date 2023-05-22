import Foundation
import SwiftUI

struct Classification: Codable, Hashable {
    let primary: Bool
    let segment: Genre
    let genre: Genre?
    let subGenre: Genre?
    let type: Genre?
    let subType: Genre?
    let family: Bool
}
