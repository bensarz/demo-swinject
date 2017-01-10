import Foundation

class MarketBehaviours: MarketBehaving {
    
    // MARK: - Properties
    
    let localeStore: LocaleStorable
    
    // MARK: - Initialization
    
    required init(localeStore: LocaleStorable) {
        self.localeStore = localeStore
    }
    
}
