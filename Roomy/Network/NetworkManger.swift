//
//  NetworkManger.swift
//  Roomy
//
//  Created by Yehia Samak on 11/15/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManger{
    
    static func signIn(email : String, password : String, completionHandler : @escaping (Result<[String : Any]>) -> Void){
        let urlRequest : NetworkRouter = NetworkRouter.signIn(email: email, password: password);
        Alamofire.request(urlRequest).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                completionHandler(Result.success(value as! [String : Any]));
            case .failure(let error):
                completionHandler(Result.failure(error));
            }
        }
    }
    
    static func signUn(name : String, email : String, password : String, completionHandler : @escaping (Result<[String : Any]>) -> Void){
        let urlRequest : NetworkRouter = NetworkRouter.signUp(name : name, email: email, password: password);
           Alamofire.request(urlRequest).responseJSON { (response) in
               switch response.result{
               case .success(let value):
                   completionHandler(Result.success(value as! [String : Any]));
               case .failure(let error):
                   completionHandler(Result.failure(error));
               }
        };
       }
    
    static func getRooms(auth : String, completionHandler : @escaping (Result<[Any]>)->Void){
        let urlRequest = NetworkRouter.getRooms(auth: auth);
        Alamofire.request(urlRequest).responseJSON { (response) in
            switch response.result {
            
            case .success(let value):
                print(value);
                completionHandler(Result.success(value as! [Any]));
            case .failure(let error):
                completionHandler(Result.failure(error));
            }
        };
        
        
    }
    static func addRoom(auth : String, title: String, place: String, price: Double, description: String, image: String, completionHandler : @escaping (Result<[String : Any]>)->Void){
        let urlRequest = NetworkRouter.addRoom(auth: auth, title: title, place: place, price: price, description: description, image: image);
         Alamofire.request(urlRequest).responseJSON { (response) in
             switch response.result {
             case .success(let value):
                 completionHandler(Result.success(value as! [String : Any]));
             case .failure(let error):
                 completionHandler(Result.failure(error));
             }
         };
         
         
     }
    
    
}

    


