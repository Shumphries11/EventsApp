import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: FeaturedCell.self)
    static let nib = UINib(nibName: String(describing: FeaturedCell.self), bundle: nil)

    @IBOutlet weak var featuredCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
