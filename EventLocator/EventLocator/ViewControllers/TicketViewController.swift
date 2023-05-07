import UIKit

class TicketViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, Event>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            switch sectionType {
            case .ticket: return LayoutSectionFactory.ticket()
            default: return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTV()
    }
    
    private func initializeTV() {
        setupTicketVC()
        setupTicketDataSource()
    }
    
    private func setupTicketVC() {
        let cells: [RegisterableView] = [
            .nib(TicketCell.self)
        ]
        collectionView.register(cells: cells)
//        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func setupTicketDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Event>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            switch sectionType {
            case .ticket:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                  return nil
              }
          }
        
        let sections = [
            Section(type: .ticket, items: [Event()])
            ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Event>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false )
    }
}
