import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
  
    static let reuseIdentifier = String(describing: FeaturedCell.self)
    static let nib = UINib(nibName: String(describing: FeaturedCell.self), bundle: nil)

    @IBOutlet weak var featuredCell: UIView!
    
    @IBOutlet weak var imgEvent: UIImageView!
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        lblType.text = ""
        if let classification = event.classifications {
            if classification.count > 0 {
                lblType.text = classification[0].genre?.name ?? ""
            }
        }
    
        lblDate.text = event.dates?.start.localDate
        if let image = event.images?.first {
            if let url = URL(string: image.url) {
                imgEvent.load(url: url)
            }
        }
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
