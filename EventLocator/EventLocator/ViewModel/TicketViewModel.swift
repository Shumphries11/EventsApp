import Foundation
import Combine

class TicketViewModel: ObservableObject {
    @Published private(set) var ticketDetails: Event?
    
    private var cancellables: Set<AnyCancellable> = []
    private let apiClient: API
    
    init(apiClient: API = API()) {
        self.apiClient = apiClient
    }
    
    func fetchTicketDetails(id: String) {
        API().fetchEventDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished fetching event")
                }
            }, receiveValue: { [weak self] ticketDetails in
                self?.ticketDetails = ticketDetails
            }).store(in: &cancellables)
    }

}
