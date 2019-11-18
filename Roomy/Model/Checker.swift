//
//  Checker.swift
//  Roomy
//
//  Created by Yehia Samak on 11/13/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation

class Checker{
    static func isValidName(name : String?) -> Bool{
        if let n = name{
            return n.count > 3;
        }
        return false;
    }
    
    static func isValidEmail(email : String?) ->Bool{
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}";
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx);
        return pred.evaluate(with: email);
    }
    
    static func isValidPassword(password : String?)->Bool{
        guard password != nil else { return false }
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
          return passwordTest.evaluate(with: password)
    }
}
