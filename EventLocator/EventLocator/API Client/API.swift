import Foundation
import SwiftUI
import Combine

struct API {
    private struct Constants {
        static let apiKey = "DxqVnKOE1vGNb5GIxktGlmfzxGfi8QQv"
        static let latLong = "32.3182314,-86.9022980"
        static let locale = "*"
        static let page = "3"
        static let countryCode = "US"
        static let stateCode = "AL"
        static let radius = "100"
        
    }
    
    enum Error: LocalizedError, Identifiable {
        var id: String {localizedDescription}
        
        case addressUnreachable(URL)
        case invalidResponse
        
        var errorDescription: String? {
            switch self {
            case .invalidResponse: return "Invalid service: this service does not exist."
            case .addressUnreachable(let url): return "\(url.debugDescription)"
            }
        }
    }
    
    enum EndPoint {
        static let baseURL = URL(string: "https://app.ticketmaster.com/")!
        
        case events
        case suggestions
        case eventDetail(String)
        
        var url: URL {
            switch self {
            case .events:
                return EndPoint.baseURL.appendingPathComponent("discovery/v2/events")
                    .appending("apikey", value: API.Constants.apiKey)
                    .appending("latlong", value: API.Constants.latLong)
                    .appending("locale", value: API.Constants.locale)
                    .appending("page", value: API.Constants.page)
                    .appending("countryCode", value: API.Constants.countryCode)
                    .appending("stateCode", value: API.Constants.stateCode)
            case .suggestions:
                return EndPoint.baseURL.appendingPathComponent("/discovery/v2/suggest")
                    .appending("apikey", value: API.Constants.apiKey)
                    .appending("radius", value: API.Constants.radius)
                    .appending("locale", value: API.Constants.locale)
                    .appending("countryCode", value: API.Constants.countryCode)
            case .eventDetail(let id):
                return EndPoint.baseURL.appendingPathComponent("/discovery/v2/events/\(id)")
                    .appending("apikey", value: API.Constants.apiKey)
            }
        }
        
        static func request(with url: URL) -> URLRequest {
            var request = URLRequest(url: url)
            dump(url.absoluteString)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
            
        }
    }
    
    private let decoder = Utils.decoder
    
    func fetchEvents() -> AnyPublisher<[Event], Error>{
        
        URLSession.shared.dataTaskPublisher(for: EndPoint.request(with: EndPoint.events.url))
            .map(\.data)
            .decode(type: TicketMaster.self, decoder: decoder)
            .print()
            .mapError { error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(EndPoint.events.url)
                default: return Error.invalidResponse
                }
            }
            .print()
            .map(\.embedded.events)
            .eraseToAnyPublisher()
    }
    
    func fetchSuggestions() -> AnyPublisher<[Event], Error>{
        URLSession.shared.dataTaskPublisher(for: EndPoint.request(with: EndPoint.suggestions.url))
            .map(\.data)
            .decode(type: Suggest.self, decoder: decoder)
            .print()
            .mapError { error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(EndPoint.suggestions.url)
                default: return Error.invalidResponse
                }
            }
            .print()
            .map(\.embedded.events)
            .eraseToAnyPublisher()
    }
    
    func fetchEventDetail(id: String) -> AnyPublisher<EventDetail, Error>{
        URLSession.shared.dataTaskPublisher(for: EndPoint.request(with: EndPoint.eventDetail(id).url))
            .map(\.data)
            .decode(type: EventDetail.self, decoder: decoder)
            .print()
            .mapError { error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(EndPoint.eventDetail(id).url)
                default: return Error.invalidResponse
                }
            }
            .print()
            //.map(\.self)
            .eraseToAnyPublisher()
    }
}
