import UIKit

class SeeMoreViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .nearYou: return LayoutSectionFactory.seeMore()
            default: return nil
            }
        }
        return layout
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavItems()
        initializeSM()
    }
    
    private func initializeSM() {
        setupSeeMoreVC()
        setupSMDataSource()
    }
    
    private func configureNavItems() {
        navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "appPurple")!])
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action, target: self, action: nil
        )
    }
    
    private func setupSeeMoreVC() {
        searchController.searchResultsUpdater = self
        let cells: [RegisterableView] = [
            .nib(NearbyCell.self)
        ]
        collectionView.register(cells: cells)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func setupSMDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .nearYou:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearbyCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                  return nil
              }
          }
        
        let sections = [
            Section(type: .nearYou, items: [Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item()])
            ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false )
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
}


