import UIKit

class TicketCell: UICollectionViewCell, SelfConfiguringCell {
   

    @IBOutlet weak var ticketCell: UIView!
    
    static let reuseIdentifier = String(describing: TicketCell.self)
    static let nib = UINib(nibName: String(describing: TicketCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with event: Event) {
        dump(event)
    }
    

}
