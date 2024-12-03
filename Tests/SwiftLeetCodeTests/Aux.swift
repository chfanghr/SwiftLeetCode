import Foundation

internal struct FixtureNotFoundError: Error {
}

internal func readFixture<T>(fixtureName: String) throws -> T where T: Decodable {
    guard let fixtureURL = Bundle.module.url(forResource: fixtureName, withExtension: "json") else {
        throw FixtureNotFoundError()
    }
    let fixtureData = try Data(contentsOf: fixtureURL)
    let decoder = JSONDecoder()
    let fixture = try decoder.decode(T.self, from: fixtureData)
    return fixture
}
