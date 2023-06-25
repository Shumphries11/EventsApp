//import UIKit
//import SwiftUI
//import Combine
//
//enum SectionB: String, CaseIterable, Hashable {
//    case eventsHeader
//    case eventType
//    case eventTitle
//    case subTitle
//    case infoBox
//    case eventDescription
//    case buyNow
//    
//}
//
//class EventsViewController: UIViewController {
//    var event: Event?
//    var id: String?
//    
//    private var dataSource: UICollectionViewDiffableDataSource<SectionB, Event>!
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    private var viewModel: DetailViewModel!
//    private var cancellables: Set<AnyCancellable> = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("Event \(String(describing: event?.name))")
//        initializeEV()
//    }
//    
//    lazy var collectionViewLayout: UICollectionViewLayout = {
//        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
//            guard let self = self else { return nil }
//            
//            let snapshot = self.dataSource.snapshot()
//            let sectionType = snapshot.sectionIdentifiers[sectionIndex]
//            
//            switch sectionType {
//            case .eventsHeader: return LayoutSectionFactory.eventsHeader()
//            case .eventType: return LayoutSectionFactory.eventType()
//            case .eventTitle: return LayoutSectionFactory.eventTitle()
//            case .subTitle: return LayoutSectionFactory.subTitle()
//            case .infoBox: return LayoutSectionFactory.infoBox()
////            case .eventTitle: return LayoutSectionFactory.eventTitle()
//            case .eventDescription: return LayoutSectionFactory.eventDescription()
//            case .buyNow: return LayoutSectionFactory.buyNow()
//           
//            }
//        }
//        return layout
//    }()
//    
//    private func initializeEV() {
//        setupEventsCV()
//        configureEventsDataSource()
//        setupViewModel()
//        bindViewModel()
//        setupData()
//    }
//    
//    private func bindViewModel() {
//        viewModel.$details
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] details in
//                if let details = details {
//                    self?.reloadEVData()
//                    self?.collectionView.reloadData()
//                    dump(details)
//                }
//            }
//            .store(in: &cancellables)
//        
//    }
//    
//    private func setupData(){
//        viewModel?.fetchEventDetails(id: id!)
//        
//    }
//    
//    private func setupViewModel() {
//        viewModel = DetailViewModel()
//    }
//    
//    private func setupEventsCV() {
//        collectionView.contentInsetAdjustmentBehavior = .never
//        
//        let cells: [RegisterableView] = [
//            .nib(EventsHeaderCell.self),
//            .nib(EventTypeCell.self),
//            .nib(EventTitleCell.self),
//            .nib(SubTitleCell.self),
//            .nib(InfoBoxCell.self),
//            .nib(DescriptionCell.self),
//            .nib(BuyNowCell.self)
//            
//        ]
//        collectionView.register(cells: cells)
//        //        collectionView.delegate = self
//        collectionView.collectionViewLayout = collectionViewLayout
//    }
//    
//    private func configureEventsDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<SectionB, Event>(collectionView: collectionView) { [weak self]
//            (collectionView, indexPath, item) in
//            guard let self = self else { return UICollectionViewCell() }
//            
//            let snapshot = self.dataSource.snapshot()
//            let sectionType = snapshot.sectionIdentifiers[indexPath.section]
//            
//            switch sectionType {
//            case .eventsHeader: return self.configure(EventsHeaderCell.self, with: item, for: indexPath)
//            case .eventType: return self.configure(EventTypeCell.self, with: item, for: indexPath)
//            case .eventTitle: return self.configure(EventTitleCell.self, with: item, for: indexPath)
//            case .subTitle:
//                return self.configure(SubTitleCell.self, with: item, for: indexPath)
//            case .infoBox:
//                return self.configure(InfoBoxCell.self, with: item, for: indexPath)
//            case .eventDescription:
//                return self.configure(DescriptionCell.self, with: item, for: indexPath)
//            case .buyNow:
//                return self.configure(BuyNowCell.self, with: item, for: indexPath)
//            }
//        }
//        
//    }
//        
//        func reloadEVData() {
//            var snapshot = NSDiffableDataSourceSnapshot<SectionB, Event>()
//            snapshot.appendSections([.eventsHeader, .eventType, .eventTitle, .subTitle, .infoBox, .eventDescription, .buyNow])
//            snapshot.appendItems([Event()], toSection: .eventsHeader)
//            
//            snapshot.appendItems([viewModel.details!], toSection: .eventType)
//            
//            var infoDetails = viewModel.details!
//            infoDetails.id = infoDetails.id + ".info"
//            
//            snapshot.appendItems([infoDetails], toSection: .infoBox)
//            
////            snapshot.appendItems(viewModel.results, toSection: .infoBox)
////            snapshot.appendItems(viewModel.results, toSection: .eventDescription)
//            dataSource.apply(snapshot, animatingDifferences: false )
//        }
//        
//        func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with event: Event, for indexPath: IndexPath) -> T {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
//                fatalError("Unable to dequeue \(cellType)")
//            }
//            cell.configure(with: event)
//            return cell
//        }
//    }
//
//
////extension EventsViewController: UICollectionViewDelegate {
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let storyboard: UIStoryboard = UIStoryboard(name: "EventDetail", bundle: nil)
////        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
////        navigationController?.pushViewController(vc, animated: true)
////    }
////}
//
