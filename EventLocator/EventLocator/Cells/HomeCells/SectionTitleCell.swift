import UIKit

class SectionTitleCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: SectionTitleCell.self)
    static let nib = UINib(nibName: String(describing: SectionTitleCell.self), bundle: nil)

    @IBOutlet weak var sectionTitleCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
