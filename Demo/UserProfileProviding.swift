import Foundation

protocol UserProfileProviding {
    var profile: Profile { get }
    init(profile: Profile)
}
