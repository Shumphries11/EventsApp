import UIKit
import Combine

class HomeViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: HomeViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
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
        setupViewModel()
        bindViewModel()
        setupData()
    }
    
    private func bindViewModel() {
        viewModel.$results
            .receive(on: DispatchQueue.main)
            .sink { [weak self] results in
                self?.collectionView.reloadData()
                dump(results)
            }
            .store(in: &cancellables)
    }
    
    private func setupData(){
        viewModel.fetchEvents()
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
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]
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
                Section(type: .homeHeader, items: [Item()]),
                Section(type: .sectionTitle, items: [Item()]),
                Section(type: .nearYou, items: [Item(), Item(), Item()]),
                Section(type: .sectionTitle, items: [Item()]),
                Section(type: .featured, items: [Item(), Item(), Item()])
                ]
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
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


