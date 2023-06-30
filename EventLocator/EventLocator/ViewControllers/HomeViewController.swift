import UIKit
import SwiftUI
import Combine
import MapKit

enum Section: String, CaseIterable, Hashable {
    case homeHeader
    case nearYou
    case featured
    case sectionTitle
}

class HomeViewController: UIViewController {
    //    var coordinator: HomeCoordinator?
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Event>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //    private var items: [Event] = []
    private var viewModel: HomeViewModel!
    private var cancellables: Set<AnyCancellable> = []
    private var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex]
            switch sectionType {
            case .homeHeader: return LayoutSectionFactory.homeHeader()
            case .sectionTitle: return LayoutSectionFactory.sectionTitle()
            case .nearYou: return LayoutSectionFactory.nearYou()
                //            case .sectionTitle: return LayoutSectionFactory.sectionTitle()
            case .featured: return LayoutSectionFactory.featured()
            }
        }
        
        return layout
    }()
    
    private func initialize() {
        setupCollectionView()
        setupDataSource()
        setupViewModel()
        bindViewModel()
        setupData()
    }
    
    private func bindViewModel() {
        viewModel.$nearYouResults
            .receive(on: DispatchQueue.main)
            .sink { [weak self] results in
                self?.reloadData()
                self?.collectionView.reloadData()
//                dump(results)
            }
            .store(in: &cancellables)
        
        viewModel.$featuredResults
            .receive(on: DispatchQueue.main)
            .sink { [weak self] suggestResults in
                self?.reloadData()
                self?.collectionView.reloadData()
//                dump(suggestResults)
            }
            .store(in: &subscriptions)
    }
    
    private func setupData(){
        viewModel?.fetchEvents()
        viewModel.fetchSuggestions()
    }
    
    private func setupViewModel() {
        viewModel = HomeViewModel()
    }
    
    private func setupCollectionView() {
        collectionView.contentInsetAdjustmentBehavior = .never
        let cells: [RegisterableView] = [
            .nib(HomeHeaderCell.self),
            .nib(SectionTitleCell.self),
            .nib(FeaturedCell.self),
            .nib(NearbyCell.self)
        ]
        collectionView.register(cells: cells)
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Event>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section]
            
            switch sectionType {
            case .homeHeader: return self.configure(HomeHeaderCell.self, with: item, for: indexPath)
            case .sectionTitle: return self.configure(SectionTitleCell.self, with: item, for: indexPath)
            case .nearYou: return self.configure(NearbyCell.self, with: item, for: indexPath)
            case .featured: return self.configure(FeaturedCell.self, with: item, for: indexPath)
            }
        }
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Event>()
        snapshot.appendSections([.homeHeader, .sectionTitle, .nearYou, .featured])
        snapshot.appendItems([Event()], toSection: .homeHeader)
        snapshot.appendItems(viewModel.nearYouResults, toSection: .nearYou)
        snapshot.appendItems(viewModel.featuredResults, toSection: .featured)
        dataSource.apply(snapshot, animatingDifferences: false )
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with event: Event, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: event)
        return cell
        
    }
}
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let snapshot = self.dataSource.snapshot()
        let section = snapshot.sectionIdentifiers[indexPath.section]
//        let nearYouLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double(([viewModel.nearYouResults[indexPath.item].embedded?.venues[0].location.latitude] as! NSString).doubleValue), longitude: Double(([viewModel.nearYouResults[indexPath.item].embedded?.venues[0].location.longitude] as! NSString).doubleValue))
//        let featuredLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double(([viewModel.featuredResults[indexPath.item].embedded?.venues[0].location.latitude] as! NSString).doubleValue), longitude: Double(([viewModel.featuredResults[indexPath.item].embedded?.venues[0].location.longitude] as! NSString).doubleValue))
//        let nearYouLocation = CLLocationCoordinate2D(latitude: viewModel.nearYouResults[indexPath.item].embedded?.venues[0].location.latitude.toDouble() ?? 0.0, longitude: viewModel.nearYouResults[indexPath.item].embedded?.venues[0].location.longitude.toDouble() ?? 0.0)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "EventDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        switch section {
        case .nearYou:
//            vc.event = viewModel.nearYouResults[indexPath.item]
            vc.id = viewModel.nearYouResults[indexPath.item].id
//            vc.location = nearYouLocation
//            dump(nearYouLocation)
            navigationController?.pushViewController(vc, animated: true)
            return
        case .featured:
//            vc.event = viewModel.featuredResults[indexPath.item]
            vc.id = viewModel.featuredResults[indexPath.item].id
//            vc.location = featuredLocation
//            dump(featuredLocation)
            navigationController?.pushViewController(vc, animated: true)
            return
        default:
            return
        }
        
               
        
    }
}
//extension HomeViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView.cellForItem(at: indexPath) is SectionTitleCell {
//            let storyboard: UIStoryboard = UIStoryboard(name: "SeeMore", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "SeeMoreViewController") as! SeeMoreViewController
//            navigationController?.pushViewController(vc, animated: true)
//            self.navigationController?.navigationBar.tintColor = UIColor(named: "appPurple")
//        }
//    }
//}
extension String
{
    /// EZSE: Converts String to Double
    public func toDouble() -> Double?
    {
       if let num = NumberFormatter().number(from: self) {
                return num.doubleValue
            } else {
                return nil
            }
     }
}

