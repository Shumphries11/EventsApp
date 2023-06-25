import UIKit
import Combine

enum SectionC {
    case detailImage
    case detailTitle
    case detailDescription
    case detailInfo
    case locationPin
    case buyButton
}

class DetailViewController: UIViewController {
    var event: Event?
    var id: String?
    private var viewModel: DetailViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    
    private var dataSource: UICollectionViewDiffableDataSource<SectionC, Event>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex]
            
            switch sectionType {
            case .detailImage: return LayoutSectionFactory.detailImage()
            case .detailTitle: return LayoutSectionFactory.detailTitle()
            case .detailDescription: return LayoutSectionFactory.detailDescription()
            case .detailInfo: return LayoutSectionFactory.detailInfo()
            case .locationPin: return LayoutSectionFactory.locationPin()
            case .buyButton: return LayoutSectionFactory.buyButton()
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDV()
        title = event?.name
    }
    
    private func initializeDV() {
        setupDetailCV()
        configureDetailDataSource()
        setupViewModel()
        bindViewModel()
        setupData()
    }
    
    private func bindViewModel() {
        viewModel.$details
            .receive(on: DispatchQueue.main)
            .sink { [weak self] details in
                if let details = details {
                    self?.reloadDetailData()
                    self?.collectionView.reloadData()
                    dump(details)
                }
            }
            .store(in: &cancellables)
        
    }
    
    private func setupData(){
        viewModel?.fetchEventDetails(id: id!)
        
    }
    
    private func setupViewModel() {
        viewModel = DetailViewModel()
    }
    
    private func setupDetailCV() {
        let cells: [RegisterableView] = [
            .nib(DetailImageCell.self),
            .nib(DetailTitleCell.self),
            .nib(DetailDescriptCell.self),
            .nib(DetailInfoCell.self),
            .nib(DetailMapCell.self),
            .nib(BuyButtonCell.self)
        ]
        collectionView.register(cells: cells)
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func configureDetailDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionC, Event>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section]
            
            switch sectionType {
            case .detailImage: return self.configure(DetailImageCell.self, with: item, for: indexPath)
            case .detailTitle: return self.configure(DetailTitleCell.self, with: item, for: indexPath)
            case .detailDescription: return self.configure(DetailDescriptCell.self, with: item, for: indexPath)
            case .detailInfo: return self.configure(DetailInfoCell.self, with: item, for: indexPath)
            case .locationPin: return self.configure(DetailMapCell.self, with: item, for: indexPath)
            case .buyButton: return self.configure(BuyButtonCell.self, with: item, for: indexPath)
            }
        }
    }
        
        func reloadDetailData() {
            var snapshot = NSDiffableDataSourceSnapshot<SectionC, Event>()
            snapshot.appendSections([.detailImage, .detailTitle, .detailDescription, .detailInfo, .locationPin, .buyButton])
                                     
            snapshot.appendItems([Event()], toSection: .detailImage)
            
            snapshot.appendItems([viewModel.details!], toSection: .detailTitle)
            
            var detailDescript = viewModel.details!
            detailDescript.id = detailDescript.id + ".descript"
            
            snapshot.appendItems([detailDescript], toSection: .detailDescription)
            
            var detailInfo = viewModel.details!
            detailInfo.id = detailInfo.id + ".info"
            
            snapshot.appendItems([detailInfo], toSection: .detailInfo)
            
            var detailLocation = viewModel.details!
            detailLocation.id = detailLocation.id + ".loctaion"
            
            snapshot.appendItems([detailLocation], toSection: .locationPin)
            
            var detailBuy = Event()
            detailBuy.id = ".buy"
            
            snapshot.appendItems([detailBuy], toSection: .buyButton)

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


extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let snapshot = self.dataSource.snapshot()
        let section = snapshot.sectionIdentifiers[indexPath.section]
        let storyboard: UIStoryboard = UIStoryboard(name: "Ticket", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TicketViewController") as! TicketViewController
        
        switch section {
        case .buyButton:
            vc.ticketEvent = event
            vc.ticketId = id!
            dump(id!)
            navigationController?.pushViewController(vc, animated: true)
            return
       
        default:
            return
        }
    }
}
