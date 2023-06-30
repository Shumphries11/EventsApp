import Foundation
import Combine

class DetailViewModel: ObservableObject {
    @Published private(set) var detail: EventDetail?
    
    private var cancellables: Set<AnyCancellable> = []
    private let apiClient: API
    
    init(apiClient: API = API()) {
        self.apiClient = apiClient
    }
    
    func fetchEventDetails(id: String) {
        API().fetchEventDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished fetching event")
                }
            }, receiveValue: { [weak self] details in
                self?.detail = details
            }).store(in: &cancellables)
    }

}
