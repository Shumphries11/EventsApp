import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published private(set) var results: [Event] = []
    private var cancellables: Set<AnyCancellable> = []
    private let apiClient: API
    
    init(apiClient: API = API()) {
        self.apiClient = apiClient
    }
    
    func fetchEvents() {
        API().fetchEvents()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished fetching events")
                }
            }, receiveValue: { [weak self] results in
                self?.results = results
            }).store(in: &cancellables)
    }

}
