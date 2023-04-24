import UIKit

class SubTitleCell: UICollectionViewCell {
    
    @IBOutlet weak var subTitleCell: UIView!
    
    static let reuseIdentifier = String(describing: SubTitleCell.self)
    static let nib = UINib(nibName: String(describing: SubTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
