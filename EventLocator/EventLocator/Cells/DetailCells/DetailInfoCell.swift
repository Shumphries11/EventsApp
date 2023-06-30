import UIKit

class DetailInfoCell: UICollectionViewCell, SelfConfiguringDetailCell {

    @IBOutlet weak var detailInfoCell: UIView!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    static let reuseIdentifier = String(describing: DetailInfoCell.self)
    static let nib = UINib(nibName: String(describing: DetailInfoCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: EventDetail) {
        lblLocation.text = (event.embedded?.venues[0].city.name)! + ", " + ((event.embedded?.venues[0].state.stateCode)!)
        lblDate.text = event.dates?.start.localDate
        lblTime.text = event.dates?.start.localTime
    }

}
