
import UIKit

class DescriptionCell: UICollectionViewCell, SelfConfiguringCell {



    @IBOutlet weak var descriptionCell: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    static let reuseIdentifier = String(describing: DescriptionCell.self)
    static let nib = UINib(nibName: String(describing: DescriptionCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
//        dump(event)
    }

}
