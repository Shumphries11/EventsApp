import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: HomeHeaderCell.self)
    static let nib = UINib(nibName: String(describing: HomeHeaderCell.self), bundle: nil)

    @IBOutlet weak var homeHeaderCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
