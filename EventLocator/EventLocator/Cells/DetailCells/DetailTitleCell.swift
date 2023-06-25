import UIKit

class DetailTitleCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var detailTitleCell: UIView!
    
    static let reuseIdentifier = String(describing: DetailTitleCell.self)
    static let nib = UINib(nibName: String(describing: DetailTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
