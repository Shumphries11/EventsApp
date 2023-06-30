import UIKit

class TicketCell: UICollectionViewCell, SelfConfiguringDetailCell {
   

    @IBOutlet weak var ticketCell: UIView!
    
    @IBOutlet weak var imgEvent: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblSeat: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    static let reuseIdentifier = String(describing: TicketCell.self)
    static let nib = UINib(nibName: String(describing: TicketCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with event: EventDetail) {
        lblTitle.text = event.name
        lblDate.text = event.dates?.start.localDate
        lblTime.text = event.dates?.start.localTime
        if let image = event.images?.first {
            if let url = URL(string: image.url) {
                imgEvent.load(url: url)
            }
        }
    }
    

}
