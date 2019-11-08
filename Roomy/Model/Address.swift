//
//  Address.swift
//  Roomy
//
//  Created by Yehia Samak on 11/7/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
class Address{
    private let buldingNo : Int;
    private let streetName : String;
    private let city : String;
    private let country : String;
    private let zipCode  : String;
    
    init(buldingNo : Int, streetName : String, city : String, country: String, zipCode : String) {
        self.buldingNo = buldingNo;
        self.city = city;
        self.country = country;
        self.streetName = streetName;
        self.zipCode = zipCode;
    }
    func printAdress1()->String{
        return String(buldingNo) + " " + streetName;
    }
    func printAdress2()->String{
        return city + ", " + country + " " + zipCode;
    }
}
