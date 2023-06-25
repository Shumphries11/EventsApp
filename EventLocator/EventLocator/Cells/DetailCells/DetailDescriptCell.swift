import UIKit

class DetailDescriptCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var detailDescriptCell: UILabel!
    
    static let reuseIdentifier = String(describing: DetailDescriptCell.self)
    static let nib = UINib(nibName: String(describing: DetailDescriptCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
