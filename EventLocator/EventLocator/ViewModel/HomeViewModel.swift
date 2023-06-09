import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published private(set) var nearYouResults: [Event] = []
    @Published private(set) var featuredResults: [Event] = []
    private var cancellables: Set<AnyCancellable> = []
    private var subscriptions: Set<AnyCancellable> = []
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
                self?.nearYouResults = results
            }).store(in: &cancellables)
    }
    
    func fetchSuggestions() {
        API().fetchSuggestions()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished fetching suggestions")
                }
            }, receiveValue: { [weak self] suggestResults in
                self?.featuredResults = suggestResults
            }).store(in: &subscriptions)
    }

}
