import Swinject
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = Registry.currentUserContainer
        
        let userProfileProviding = container?.resolve(UserProfileProviding.self)
        usernameLabel.text = userProfileProviding?.profile.username
        
        let settingsProviding = container?.resolve(SettingsProviding.self)
        if settingsProviding?.isLoggedIn ?? false {
            usernameLabel.text = usernameLabel.text?.appending(" ✅")
        } else {
            usernameLabel.text = usernameLabel.text?.appending(" ❌")
        }
    }
    
    // MARK: - Actions
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        Registry.removeUserContainer()
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
}
