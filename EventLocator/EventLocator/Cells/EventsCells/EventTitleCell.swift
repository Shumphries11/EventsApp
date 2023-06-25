import UIKit

class EventTitleCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var eventTitle: UIView!
    
    static let reuseIdentifier = String(describing: EventTitleCell.self)
    static let nib = UINib(nibName: String(describing: EventTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
