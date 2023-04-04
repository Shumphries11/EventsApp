import Foundation


struct Section: Hashable {
    let id = UUID()
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Event]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items:[Event] = []) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum EventSectionType: String {
        case homeHeader
        case sectionTitle
        case nearYou
        case featured
       
    }
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        static let homeHeader = SectionType(rawValue: Section.EventSectionType.homeHeader.rawValue)
        static let sectionTitle = SectionType(rawValue: Section.EventSectionType.sectionTitle.rawValue)
        static let nearYou = SectionType(rawValue: Section.EventSectionType.nearYou.rawValue)
        static let featured = SectionType(rawValue: Section.EventSectionType.featured.rawValue)
        
    }
}
