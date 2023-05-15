import UIKit

class EventsViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            switch sectionType {
            case .eventsHeader: return LayoutSectionFactory.eventsHeader()
            case .eventType: return LayoutSectionFactory.eventType()
            case .eventTitle: return LayoutSectionFactory.eventTitle()
            case .subTitle: return LayoutSectionFactory.subTitle()
            case .infoBox: return LayoutSectionFactory.infoBox()
            case .eventTitle: return LayoutSectionFactory.eventTitle()
            case .eventDescription: return LayoutSectionFactory.eventDescription()
            case .buyNow: return LayoutSectionFactory.buyNow()
            default: return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        setupEventsCV()
        configureEventsDataSource()
    }
    
    private func setupEventsCV() {
        collectionView.contentInsetAdjustmentBehavior = .never
        let cells: [RegisterableView] = [
            .nib(EventsHeaderCell.self),
            .nib(EventTypeCell.self),
            .nib(EventTitleCell.self),
            .nib(SubTitleCell.self),
            .nib(InfoBoxCell.self),
            .nib(DescriptionCell.self),
            .nib(BuyNowCell.self)
            
        ]
        collectionView.register(cells: cells)
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func configureEventsDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .eventsHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsHeaderCell.reuseIdentifier, for: indexPath)
                return cell
            case .eventType:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventTypeCell.reuseIdentifier, for: indexPath)
                return cell
            case .eventTitle:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventTitleCell.reuseIdentifier, for: indexPath)
                return cell
            case .subTitle:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubTitleCell.reuseIdentifier, for: indexPath)
                return cell
            case .infoBox:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoBoxCell.reuseIdentifier, for: indexPath)
                return cell
            case .eventTitle:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventTitleCell.reuseIdentifier, for: indexPath)
                return cell
            case .eventDescription:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCell.reuseIdentifier, for: indexPath)
                return cell
            case .buyNow:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyNowCell.reuseIdentifier, for: indexPath)
                return cell
          default:
                return nil
            }
        }
            
            let sections = [
                Section(type: .eventsHeader, items: [Item()]),
                Section(type: .eventType, items: [Item(), Item(), Item(), Item(), Item(), Item(), Item()]),
                Section(type: .eventTitle, items: [Item()]),
                Section(type: .subTitle, items: [Item()]),
                Section(type: .infoBox, items: [Item()]),
                Section(type: .eventTitle, items: [Item()]),
                Section(type: .eventDescription, items: [Item()]),
                Section(type: .buyNow, items: [Item()])
                ]
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: false )
        }
}

extension EventsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "EventDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

