import Foundation

protocol SettingsProviding: class {
    var isLoggedIn: Bool { get set }
    init(isLoggedIn: Bool)
}
