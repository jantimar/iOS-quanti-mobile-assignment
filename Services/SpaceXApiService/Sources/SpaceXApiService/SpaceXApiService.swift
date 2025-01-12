import Foundation
import Models
import APIService

public protocol SpaceXApiServiceProtocol {
    /// Fetch all available rockets
    func fetchRockets() async throws -> [Rocket]
}

public final class SpaceXApiService {
    private let baseUrl: String
    private let apiService: APIServiceProtocol

    public init(
        apiService: APIServiceProtocol = APIService(),
        baseUrl: String
    ) {
        self.apiService = apiService
        self.baseUrl = baseUrl
    }
}

// MARK: - SpaceXApiServiceProtocol
extension SpaceXApiService: SpaceXApiServiceProtocol {

    public func fetchRockets() async throws -> [Rocket] {
        let resource: Resource = .rockets(baseUrl)
        let items: [RocketDto] = try await apiService.fetch(resource: resource)
        return items.map(Rocket.init(from:))
    }
}
