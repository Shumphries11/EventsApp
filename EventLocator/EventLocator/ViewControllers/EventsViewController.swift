import UIKit

class EventsViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Event>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            switch sectionType {
            case .homeHeader: return LayoutSectionFactory.homeHeader()
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
            .nib(HomeHeaderCell.self)
        ]
        collectionView.register(cells: cells)
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func configureEventsDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Event>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .homeHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.reuseIdentifier, for: indexPath)
                return cell
          default:
                return nil
            }
        }
            
            let sections = [
                Section(type: .homeHeader, items: [Event()]),
                ]
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Event>()
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

