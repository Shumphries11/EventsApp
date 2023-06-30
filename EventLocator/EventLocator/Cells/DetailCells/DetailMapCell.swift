import UIKit
import MapKit

class DetailMapCell: UICollectionViewCell,SelfConfiguringDetailCell {

    @IBOutlet weak var detailMapCell: MKMapView!
    
    static let reuseIdentifier = String(describing: DetailMapCell.self)
    static let nib = UINib(nibName: String(describing: DetailMapCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
       initialize()
    }
    
    func configure(with event: EventDetail) {
        
//        dump(event)
    }
    private func initialize() {
        setupMapViewCell()
    }
    
    private func setupMapViewCell() {
//        detailMapCell.overrideUserInterfaceStyle = .dark
    }
    
    
    func annotate(annotation: Venue? ) {
//            if let event = annotation {
//                detailMapCell.centerToLocation(annotation?.location)
//                detailMapCell.addAnnotation(event)
//
//                let region = MKCoordinateRegion(
//                    center: event.coordinate,
//                    latitudinalMeters: 0,
//                    longitudinalMeters: 0)
//
//                detailMapCell.setCameraBoundary(
//                    MKMapView.CameraBoundary(coordinateRegion: region),
//                    animated: true)
//
//            }

    }
    

}

private extension MKMapView {
    
    func centerToLocation(
        _ location: CLLocationCoordinate2D,
        regionRadius: CLLocationDistance = 500
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
