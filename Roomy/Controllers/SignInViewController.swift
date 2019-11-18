//
//  SignInViewController.swift
//  Roomy
//
//  Created by Yehia Samak on 11/6/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit
import SwiftyJSON

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    var json : JSON?;
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.roundButtonDesign();
        
    }
    

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        closeKeyboard();
        if(checkInput()){
            let email = usernameTextField.text!;
            let password = passwordTextField.text!;
            NetworkManger.signIn(email: email, password: password) { (response) in
                switch response{
                case .success(let value):
                    self.json = JSON(value);
                    print(self.json!);
                    if let auth = self.json!["auth_token"].string {
                        self.performSegue(withIdentifier: "loginSeg", sender: nil);
                        
                    }else{
                        self.makeAlert(title: "password and username do not match", message: "Check you password and username (email)");
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    self.makeAlert(title: "Connection error", message: "Please check your internet connecion and try agin");
                }
            }
        }else{
            makeAlert(title: "UserName or password is not right", message: "username should be valid email and pasword at least 8 charter. it should contain at leat 1 Captial letter , 1 small letter and 1 digit");
        }
      
    }
    func checkInput()->Bool{
        return Checker.isValidEmail(email: usernameTextField.text) && Checker.isValidPassword(password: passwordTextField.text);
    }
    func makeAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func closeKeyboard(){
        usernameTextField.resignFirstResponder();
        passwordTextField.resignFirstResponder();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginSeg"){
            let reciverVC = segue.destination as! RoomsTableViewController;
            reciverVC.auth = json!["auth_token"].string;
                   
        }
       
    }
   
    
}

