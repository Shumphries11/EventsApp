import UIKit

class DetailImageCell: UICollectionViewCell, SelfConfiguringCell {
   
    @IBOutlet weak var detailImageCell: UIImageView!
    
    static let reuseIdentifier = String(describing: DetailImageCell.self)
    static let nib = UINib(nibName: String(describing: DetailImageCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with event: Event) {
        if let image = event.images?.first {
            if let url = URL(string: image.url) {
                detailImageCell.load(url: url)
            }
        }
    }

}
