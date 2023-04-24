import UIKit

class BuyNowCell: UICollectionViewCell {

    @IBOutlet weak var buyNowCell: UIView!
    
    static let reuseIdentifier = String(describing: BuyNowCell.self)
    static let nib = UINib(nibName: String(describing: BuyNowCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
