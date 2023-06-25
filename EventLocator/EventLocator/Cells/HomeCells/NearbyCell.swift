import UIKit

class NearbyCell: UICollectionViewCell, SelfConfiguringCell {
  
    static let reuseIdentifier = String(describing: NearbyCell.self)
    static let nib = UINib(nibName: String(describing: NearbyCell.self), bundle: nil)

    @IBOutlet weak var nearbyCell: UIView!
    
    @IBOutlet weak var imgEvent: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        lblTitle.text = event.name
        lblDate.text = event.dates?.start.localDate
        if let image = event.images?.first {
            if let url = URL(string: image.url) {
                imgEvent.load(url: url)
            }
        }
    }

    
    

}
