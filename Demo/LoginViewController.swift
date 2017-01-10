import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = Registry.currentUserContainer {
            let okAction = UIAlertAction(title: "Ok",
                                         style: .default,
                                         handler: nil)
            let alert = UIAlertController(title: "User Container",
                                          message: "The user container still exists.",
                                          preferredStyle: .alert)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Segues
    
    enum SegueID: String {
        case presentViewController = "SegueIDPresentViewController"
    }
    
    // MARK: - Actions
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        // FIXME: [BS] Nov 10, 2016
        // Perform network request and update registry with proper values.
        let profile = Profile(firstName: "Hello",
                              lastName: "World",
                              password: password,
                              username: username)
        Registry.makeUserContainer(with: profile)
        let container = Registry.currentUserContainer
        let serviceProviding = container?.resolve(SettingsProviding.self)
        serviceProviding?.isLoggedIn = true
        
        performSegue(withIdentifier: SegueID.presentViewController.rawValue, sender: nil)
    }
    
}
