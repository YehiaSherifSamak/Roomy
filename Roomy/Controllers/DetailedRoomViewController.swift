//
//  DetailedRoomViewController.swift
//  Roomy
//
//  Created by Yehia Samak on 11/6/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class DetailedRoomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar();

        // Do any additional setup after loading the view.
    }
    
    func hideNavBar(){
          self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController!.navigationBar.shadowImage = UIImage()
           self.navigationController!.navigationBar.isTranslucent = true
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButoonTaped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButton2(_ sender: UIButton) {
         _ = navigationController?.popViewController(animated: true)
    }
}
