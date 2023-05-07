import UIKit

class DetailViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, Event>!

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            switch sectionType {
            case .detailImage: return LayoutSectionFactory.detailImage()
            case .detailTitle: return LayoutSectionFactory.detailTitle()
            case .detailDescription: return LayoutSectionFactory.detailDescription()
            case .detailInfo: return LayoutSectionFactory.detailInfo()
            case .locationPin: return LayoutSectionFactory.locationPin()
            case .buyButton: return LayoutSectionFactory.buyButton()
            default: return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDV()
    }
    
    private func initializeDV() {
        setupDetailCV()
        configureDetailDataSource()
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
        dataSource = UICollectionViewDiffableDataSource<Section, Event>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            switch sectionType {
            case .detailImage:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailImageCell.reuseIdentifier, for: indexPath)
                return cell
            case .detailTitle:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTitleCell.reuseIdentifier, for: indexPath)
                return cell
            case .detailDescription:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailDescriptCell.reuseIdentifier, for: indexPath)
                return cell
            case .detailInfo:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailInfoCell.reuseIdentifier, for: indexPath)
                return cell
            case .locationPin:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailMapCell.reuseIdentifier, for: indexPath)
                return cell
            case .buyButton:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyButtonCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                  return nil
              }
          }
        
        let sections = [
            Section(type: .detailImage, items: [Event()]),
            Section(type: .detailTitle, items: [Event()]),
            Section(type: .detailDescription, items: [Event()]),
            Section(type: .detailInfo, items: [Event()]),
            Section(type: .locationPin, items: [Event()]),
            Section(type: .buyButton, items: [Event()])
            ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Event>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false )
        
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ticket", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TicketViewController") as! TicketViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
