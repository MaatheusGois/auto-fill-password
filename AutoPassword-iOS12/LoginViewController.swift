//
//  LoginViewController.swift
//  AutoPassword-iOS12
//
//  Created by Vineet Choudhary on 23/09/18.
//  Copyright © 2018 Developer Insider. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self

        usernameTextField.textContentType = .username
        passwordTextField.textContentType = .password

        usernameTextField.keyboardType = .default
        passwordTextField.keyboardType = .default

        passwordTextField.isSecureTextEntry = false

        usernameTextField.becomeFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            self.usernameTextField.endEditing(true)
            self.usernameTextField.keyboardType = .numberPad
            self.usernameTextField.becomeFirstResponder()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            self.passwordTextField.endEditing(true)
            self.passwordTextField.keyboardType = .numberPad
            self.passwordTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        UserDefaults.standard.username = usernameTextField.text
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let otpViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: OTPViewController.self))
        navigationController?.pushViewController(otpViewController, animated: true)
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: SignUpViewController.self))
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if (textField == passwordTextField && !passwordTextField.isSecureTextEntry) {
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.0001) {
               self.passwordTextField.isSecureTextEntry = true
           }
       }
       
       return true
   }
}
