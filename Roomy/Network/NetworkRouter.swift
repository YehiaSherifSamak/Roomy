//
//  NetworkRouter.swift
//  Roomy
//
//  Created by Yehia Samak on 11/18/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkRouter : URLRequestConvertible{
    case getRooms(auth : String)
    case signIn(email : String, password : String)
    case signUp(name : String , email : String, password : String)
    case addRoom(auth : String, title : String, place : String , price : Double, description: String, image: String)
    
    
  
    
    func asURLRequest() throws -> URLRequest {
        var url : URL {
            switch self{
            case .getRooms, .addRoom:
                return URL(string: "https://roomy-application.herokuapp.com/rooms")!;
            case .signIn:
                return URL(string : "https://roomy-application.herokuapp.com/auth/login")!;
            case .signUp:
                return URL(string: "https://roomy-application.herokuapp.com/signup")!;
            }
        }
        var method : HTTPMethod{
            switch self {
            case .signIn, .signUp, .addRoom:
                return .post;
            case .getRooms:
                return .get;
            }
        }
        var parameters : [String : String]? {
            switch self {
            case .getRooms:
                return nil;
            case .signIn( let email, let pass):
                return ["email" : email, "password" : pass];
            case .signUp(let name, let mail, let pass):
                return ["name" : name, "email" : mail, "password" : pass];
            case .addRoom( _, let title, let place, let price, let description, let image):
                return ["title": title, "place" : place, "price": String(price),
                        "description": description, "image": image];
            }
        }
        var urlRequest : URLRequest = try! URLRequest(url: url, method: method);
        switch self {
        case .getRooms(let auth), .addRoom(let auth, _, _, _, _, _):
            print(auth);
            urlRequest.addValue(auth, forHTTPHeaderField: "Authorization");
           
        case .signIn, .signUp:
            break;
        }
        let encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        return encodedURLRequest;
    }
    
    
}
