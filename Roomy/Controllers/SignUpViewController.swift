//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Yehia Samak on 11/12/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit
import SwiftyJSON

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var siginUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        siginUpButton.roundButtonDesign();
       
    }
    

    @IBAction func signUpPressed(_ sender: UIButton) {
        closeKeyboard();
        if(isValidInput()){
            let name = nameTextField.text!;
            let password = passwordTextField.text!;
            let email = emailTextField.text!;
            NetworkManger.signUn(name: name, email: email, password: password) { (response) in
                switch response{
                case .success(let value):
                       let json : JSON = JSON(value);
                       if(json["message"].string! == "Account created successfully"){
                        let alert = UIAlertController(title: "Sucsessfull", message: "account has created", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (a) in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true, completion: nil)
                       }else{
                        self.makeAlert(title: "input is not valid", message: "please try agin)");
                       }
                    break
                case .failure(let error):
                     print(error)
                     self.makeAlert(title: "Connection error", message: "please check your internet connection and try agin")
                    
                }
            };
        }
    }
    
    func isValidInput()->Bool{
      
        let name = nameTextField.text;
        let password = passwordTextField.text;
        let email = emailTextField.text;
        if !Checker.isValidName(name: name){
            makeAlert(title: "Name is missing or invalid", message: "Name should be at least 4 charachters");
            return false;
        }
        if !Checker.isValidEmail(email: email){
           makeAlert(title: "Email is invalid", message: "please enter valid email");
            return false;
        }
        if !Checker.isValidPassword(password: password){
            makeAlert(title: "Passwod is invalid", message: "Passwod should consist of 8 or more charecter and have at least 1 captical letter , 1 small letter and 1 digit");
            return false;
        }
        return true;
    }
    
 
    
    func makeAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func closeKeyboard(){
        nameTextField.resignFirstResponder();
        passwordTextField.resignFirstResponder();
        emailTextField.resignFirstResponder();
    }
   
}
