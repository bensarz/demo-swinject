import Foundation

class UserProfileProvider: UserProfileProviding {
    
    let profile: Profile
    
    required init(profile: Profile) {
        self.profile = profile
    }
    
}
