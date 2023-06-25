import UIKit

class DetailInfoCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var detailInfoCell: UIView!
    
    static let reuseIdentifier = String(describing: DetailInfoCell.self)
    static let nib = UINib(nibName: String(describing: DetailInfoCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
