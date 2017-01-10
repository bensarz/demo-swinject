import Swinject

class Registry {
    
    // MARK: - Properties
    
    static let globalContainer = Container()
    private static var userContainer: Container?
    static var currentUserContainer: Container? {
        return userContainer
    }
    
    static func makeUserContainer(with profile: Profile) {
        userContainer = Container(parent: globalContainer)
        userContainer?.register(UserProfileProviding.self) { _ in
            UserProfileProvider(profile: profile)
        }.inObjectScope(.container)
    }
    
    static func removeUserContainer() {
        userContainer = nil
    }
    
}
