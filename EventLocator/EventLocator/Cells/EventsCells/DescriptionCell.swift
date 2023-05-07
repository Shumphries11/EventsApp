
import UIKit

class DescriptionCell: UICollectionViewCell {



    @IBOutlet weak var descriptionCell: UILabel!
    
    static let reuseIdentifier = String(describing: DescriptionCell.self)
    static let nib = UINib(nibName: String(describing: DescriptionCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
