import UIKit

class HomeViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, Event>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            switch sectionType {
            case .homeHeader: return LayoutSectionFactory.homeHeader()
            case .sectionTitle: return LayoutSectionFactory.sectionTitle()
            case .nearYou: return LayoutSectionFactory.nearYou()
            case .sectionTitle: return LayoutSectionFactory.sectionTitle()
            case .featured: return LayoutSectionFactory.featured()
            default: return nil
            }
        }
        
        return layout
    }()
    
    private func initialize() {
        setupCollectionView()
        setupDataSource()
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
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .homeHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.reuseIdentifier, for: indexPath)
                return cell
            case .sectionTitle:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionTitleCell.reuseIdentifier, for: indexPath)
                return cell
            case .nearYou:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearbyCell.reuseIdentifier, for: indexPath)
                return cell
            case .featured:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath)
                return cell
          default:
                return nil
            }
        }
            
            let sections = [
                Section(type: .homeHeader, items: [Event()]),
                Section(type: .sectionTitle, items: [Event()]),
                Section(type: .nearYou, items: [Event(), Event(), Event()]),
                Section(type: .sectionTitle, items: [Event()]),
                Section(type: .featured, items: [Event(), Event(), Event()])
                ]
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Event>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: false )
    }
}
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Events", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}


