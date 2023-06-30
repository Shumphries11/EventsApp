import UIKit

class SubTitleCell: UICollectionViewCell, SelfConfiguringCell {
    
    @IBOutlet weak var subTitleCell: UIView!
    
    static let reuseIdentifier = String(describing: SubTitleCell.self)
    static let nib = UINib(nibName: String(describing: SubTitleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
//        dump(event)
    }

}
