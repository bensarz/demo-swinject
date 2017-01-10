import XCTest
@testable import Demo

class LocaleStorableTests: TestCase {
    
    func testLocale() {
        guard let localeStore = Registry.globalContainer.resolve(LocaleStorable.self) else {
            XCTFail(#function)
            return
        }
        XCTAssertEqual(localeStore.locale.identifier, "fr_CA")
        XCTAssertEqual(Locale.current.identifier, "en_US")
    }
    
}
