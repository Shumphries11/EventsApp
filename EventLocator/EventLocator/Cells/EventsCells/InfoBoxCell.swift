import UIKit

class InfoBoxCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var infoBoxCell: UIView!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    static let reuseIdentifier = String(describing: InfoBoxCell.self)
    static let nib = UINib(nibName: String(describing: InfoBoxCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
//        dump(event)
    }

}
