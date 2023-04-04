import UIKit

class NearbyCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: NearbyCell.self)
    static let nib = UINib(nibName: String(describing: NearbyCell.self), bundle: nil)

    @IBOutlet weak var nearbyCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
