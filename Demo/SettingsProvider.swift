import Foundation

class SettingsProvider: SettingsProviding {
    
    var isLoggedIn: Bool
    
    required init(isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
    }
    
}
