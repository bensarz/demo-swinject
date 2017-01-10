import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: - Application Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool { // swiftlint:disable:this line_length
        configureDependencies()
        
        var localeStorable = Registry.globalContainer.resolve(LocaleStorable.self)
        withUnsafePointer(to: &localeStorable) {
            print("localeStorable: \($0)")
        }
        
        var marketBehaving = Registry.globalContainer.resolve(MarketBehaving.self)
        withUnsafePointer(to: &marketBehaving) {
            print("marketBehaving: \($0)")
        }
        
        var settingsProviding = Registry.globalContainer.resolve(SettingsProviding.self)
        print("settingsProviding: \(settingsProviding?.isLoggedIn)")
        settingsProviding?.isLoggedIn = false
        withUnsafePointer(to: &settingsProviding) {
            print("settingsProviding: \($0)")
        }
        return true
    }
    
    // MARK: - Dependency Injection
    
    func configureDependencies() {
        Registry.globalContainer.register(MarketBehaving.self) { _, localeStore in
            MarketBehaviours(localeStore: localeStore)
        }
        
        Registry.globalContainer.register(MarketBehaving.self) { r in
            let localeStorable = r.resolve(LocaleStorable.self)
            return MarketBehaviours(localeStore: localeStorable!)
        }
        
        Registry.globalContainer.register(LocaleStorable.self) { _ in
            LocaleStore(locale: Locale.current)
        }
        
        Registry.globalContainer.register(SettingsProviding.self) { _ in
            SettingsProvider(isLoggedIn: true)
            }.inObjectScope(.container)
        
        print(Registry.globalContainer)
    }
    
}
