//
//  Room.swift
//  Roomy
//
//  Created by Yehia Samak on 11/7/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class Room : Address{
    private let hastag : String;
    let images : [UIImage];
    let numberOfBedrooms : Int;
    let numberOfBathrooms : Int;
    let mainPhoto : UIImage;
    var price : Int;
    
    init(buldingNo: Int, streetName: String, city: String, country: String, zipCode: String, hastag : String, images : [UIImage], numberOfBedrooms : Int, numberOfBathrooms : Int, mainPhoto : UIImage, price : Int) {
        self.hastag = hastag;
        self.images = images;
        self.numberOfBedrooms = numberOfBedrooms;
        self.numberOfBathrooms = numberOfBathrooms;
        self.mainPhoto = mainPhoto;
        self.price = price;
        super.init(buldingNo: buldingNo, streetName: streetName, city: city, country: country, zipCode: zipCode);
    }
    override func printAdress1() -> String {
        return super.printAdress1() + " #" + hastag;
    }
}
