import UIKit

class DetailTitleCell: UICollectionViewCell {

    @IBOutlet weak var detailTitleCell: UIView!
    
    static let reuseIdentifier = String(describing: DetailTitleCell.self)
    static let nib = UINib(nibName: String(describing: DetailTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
