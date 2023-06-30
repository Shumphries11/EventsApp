import UIKit

class BuyNowCell: UICollectionViewCell, SelfConfiguringCell{

    @IBOutlet weak var buyNowCell: UIView!
    
    @IBOutlet weak var imgBookmark: UIImageView!
    
    @IBOutlet weak var btnBuyNow: UIView!
    
    static let reuseIdentifier = String(describing: BuyNowCell.self)
    static let nib = UINib(nibName: String(describing: BuyNowCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
//        dump(event)
    }

}
