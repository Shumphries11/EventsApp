import UIKit
import MapKit

class DetailMapCell: UICollectionViewCell,SelfConfiguringCell {

    @IBOutlet weak var detailMapCell: MKMapView!
    
    static let reuseIdentifier = String(describing: DetailMapCell.self)
    static let nib = UINib(nibName: String(describing: DetailMapCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
