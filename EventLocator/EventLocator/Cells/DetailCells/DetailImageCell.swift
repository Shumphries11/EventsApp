import UIKit

class DetailImageCell: UICollectionViewCell {

    @IBOutlet weak var detailImageCell: UIImageView!
    
    static let reuseIdentifier = String(describing: DetailImageCell.self)
    static let nib = UINib(nibName: String(describing: DetailImageCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
