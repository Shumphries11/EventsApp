import Foundation


struct Section: Hashable {
    let id = UUID()
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items:[Item] = []) {
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
        case eventsHeader
        case eventType
        case eventTitle
        case subTitle
        case infoBox
        case eventDescription
        case buyNow
        case detailImage
        case detailTitle
        case detailDescription
        case detailInfo
        case locationPin
        case buyButton
        case ticket
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
        static let eventsHeader = SectionType(rawValue: Section.EventSectionType.eventsHeader.rawValue)
        static let eventType = SectionType(rawValue: Section.EventSectionType.eventType.rawValue)
        static let eventTitle = SectionType(rawValue: Section.EventSectionType.eventTitle.rawValue)
        static let subTitle = SectionType(rawValue: Section.EventSectionType.subTitle.rawValue)
        static let infoBox = SectionType(rawValue: Section.EventSectionType.infoBox.rawValue)
        static let eventDescription = SectionType(rawValue: Section.EventSectionType.eventDescription.rawValue)
        static let buyNow = SectionType(rawValue: Section.EventSectionType.buyNow.rawValue)
        static let detailImage = SectionType(rawValue: Section.EventSectionType.detailImage.rawValue)
        static let detailTitle = SectionType(rawValue: Section.EventSectionType.detailTitle.rawValue)
        static let detailDescription = SectionType(rawValue: Section.EventSectionType.detailDescription.rawValue)
        static let detailInfo = SectionType(rawValue: Section.EventSectionType.detailInfo.rawValue)
        static let locationPin = SectionType(rawValue: Section.EventSectionType.locationPin.rawValue)
        static let buyButton = SectionType(rawValue: Section.EventSectionType.buyButton.rawValue)
        static let ticket = SectionType(rawValue: Section.EventSectionType.ticket.rawValue)
    }
}
