import UIKit

class EventsHeaderCell: UICollectionViewCell, SelfConfiguringCell {
   
    static let reuseIdentifier = String(describing: EventsHeaderCell.self)
    static let nib = UINib(nibName: String(describing: EventsHeaderCell.self), bundle: nil)

    @IBOutlet weak var eventsHeaderCell: UIView!
    
    @IBOutlet weak var imgEvent: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        if let image = event.images?.first {
            if let url = URL(string: image.url) {
                imgEvent.load(url: url)
            }
        }
    }

}
