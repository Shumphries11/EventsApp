import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: HomeHeaderCell.self)
    static let nib = UINib(nibName: String(describing: HomeHeaderCell.self), bundle: nil)

    @IBOutlet weak var homeHeaderCell: UIView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let searchImg = UIImage(systemName: "magnifyingglass")
        searchImg?.withTintColor(UIColor(named: "appPurple")!)
        addLeftImage(txtField: txtSearch, img: searchImg!)
    }
    
    private func addLeftImage(txtField: UITextField, img: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        imageView.image = img
        txtField.leftView = imageView
        txtField.leftViewMode = .always
    }

}
