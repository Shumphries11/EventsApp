import UIKit

class EventsHeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: EventsHeaderCell.self)
    static let nib = UINib(nibName: String(describing: EventsHeaderCell.self), bundle: nil)

    @IBOutlet weak var eventsHeaderCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
