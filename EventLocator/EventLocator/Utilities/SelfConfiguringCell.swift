import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with event: Event)
}

protocol SelfConfiguringDetailCell {
    static var reuseIdentifier: String { get }
    func configure(with event: EventDetail)
}
