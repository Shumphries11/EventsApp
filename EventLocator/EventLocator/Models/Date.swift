import Foundation
import SwiftUI

struct Date: Codable, Hashable {
    let start: Start
    let timezone: String
    let status: Status
    let spanMultipleDays: Bool
}
