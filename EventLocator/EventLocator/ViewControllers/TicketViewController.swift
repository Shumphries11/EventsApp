import UIKit
import Combine

enum SectionD {
    case ticket
}

class TicketViewController: UIViewController {
    
    var ticketEvent: EventDetail?
    var ticketId: String?
    private var viewModel: TicketViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    private var dataSource: UICollectionViewDiffableDataSource<SectionD, EventDetail>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex]
            switch sectionType {
            case .ticket: return LayoutSectionFactory.ticket()
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
        setupViewModel()
        bindViewModel()
        setupData()
    }
    
    private func bindViewModel() {
        viewModel.$ticketDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] ticketDetails in
                if let ticketDetails = ticketDetails {
                    self?.reloadDetailData()
                    self?.collectionView.reloadData()
                    dump(ticketDetails)
                }
            }
            .store(in: &cancellables)
        
    }
    
    private func setupData(){
        viewModel?.fetchTicketDetails(id: ticketId!)
        
    }
    
    private func setupViewModel() {
        viewModel = TicketViewModel()
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
        dataSource = UICollectionViewDiffableDataSource<SectionD, EventDetail>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section]
            switch sectionType {
            case .ticket: return self.configure(TicketCell.self, with: item, for: indexPath)
            }
        }
    }
    
    func reloadDetailData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionD, EventDetail>()
        snapshot.appendSections([.ticket])
                                 
        snapshot.appendItems([viewModel.ticketDetails!], toSection: .ticket)
        
        dataSource.apply(snapshot, animatingDifferences: false )
    }
   
        
        func configure<T: SelfConfiguringDetailCell>(_ cellType: T.Type, with event: EventDetail, for indexPath: IndexPath) -> T {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
                fatalError("Unable to dequeue \(cellType)")
            }
            cell.configure(with: event)
            return cell
    }
}
