//
//  SignInViewController.swift
//  Roomy
//
//  Created by Yehia Samak on 11/6/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.roundButtonDesign();

        // Do any additional setup after loading the view.
    }
    

 

}
extension  UIButton
{
    func roundButtonDesign()
    {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSize(width: 0, height: 0);
    }
}
