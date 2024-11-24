//
//  LoginViewController.swift
//  Levent
//
//  Created by Fatema Albaqali on 18/11/2024.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController loaded!")
    }

    

    struct User: Codable {
        let username: String
        let password: String
    }

    class LoginViewController: UIViewController {
        @IBOutlet weak var usernameTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var errorLabel: UILabel!

        override func viewDidLoad() {
            super.viewDidLoad()
            errorLabel.text = ""
        }

        @IBAction func loginTapped(_ sender: UIButton) {
            let enteredUsername = usernameTextField.text ?? ""
            let enteredPassword = passwordTextField.text ?? ""

            let users = loadUsers()
            if users.contains(where: { $0.username == enteredUsername && $0.password == enteredPassword }) {
                errorLabel.text = "Login successful!"
                errorLabel.textColor = .systemGreen
                // Navigate to the next screen or perform an action
            } else {
                errorLabel.text = "Invalid username or password."
                errorLabel.textColor = .systemRed
            }
        }

        func loadUsers() -> [User] {
            if let path = Bundle.main.path(forResource: "users", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let users = try JSONDecoder().decode([User].self, from: data)
                    return users
                } catch {
                    print("Error loading users: \(error)")
                }
            }
            return []
        }
    }

    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
