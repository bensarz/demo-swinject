import XCTest
@testable import Demo

class TestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Registry.globalContainer.register(LocaleStorable.self) { _ in
            let locale = Locale(identifier: "fr_CA")
            return LocaleStore(locale: locale)
        }
    }
    
    override func tearDown() {
        Registry.globalContainer.removeAll()
        super.tearDown()
    }
    
}
