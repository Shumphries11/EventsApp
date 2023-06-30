import UIKit

class DetailTitleCell: UICollectionViewCell, SelfConfiguringDetailCell {

    @IBOutlet weak var detailTitleCell: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    static let reuseIdentifier = String(describing: DetailTitleCell.self)
    static let nib = UINib(nibName: String(describing: DetailTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: EventDetail) {
        lblTitle.text = event.name
    }

}
