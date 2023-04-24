import UIKit

class InfoBoxCell: UICollectionViewCell {

    @IBOutlet weak var infoBoxCell: UIView!
    
    static let reuseIdentifier = String(describing: InfoBoxCell.self)
    static let nib = UINib(nibName: String(describing: InfoBoxCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
