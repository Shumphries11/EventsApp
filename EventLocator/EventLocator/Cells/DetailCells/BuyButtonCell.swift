import UIKit

class BuyButtonCell: UICollectionViewCell, SelfConfiguringDetailCell {

    @IBOutlet weak var buyButtonCell: UIView!
    
    static let reuseIdentifier = String(describing: BuyButtonCell.self)
    static let nib = UINib(nibName: String(describing: BuyButtonCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with event: EventDetail) {
//        dump(event)
    }

}
