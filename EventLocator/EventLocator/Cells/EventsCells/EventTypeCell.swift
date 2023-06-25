//
//  EventTypeCell.swift
//  EventLocator
//
//  Created by Santita Humphries on 4/17/23.
//

import UIKit

class EventTypeCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier = String(describing: EventTypeCell.self)
    static let nib = UINib(nibName: String(describing: EventTypeCell.self), bundle: nil)


    @IBOutlet weak var eventTypeCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with event: Event) {
        dump(event)
    }

}
