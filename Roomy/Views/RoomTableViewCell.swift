//
//  RoomTableViewCell.swift
//  Roomy
//
//  Created by Yehia Samak on 11/8/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class RoomTableViewCell : UITableViewCell{
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var adress2Label: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var noOfBedsLabel: UILabel!
    @IBOutlet weak var noOfBathsLabel: UILabel!
    @IBOutlet weak var roomImageView1: UIImageView!
    @IBOutlet weak var roomImageView2: UIImageView!
    @IBOutlet weak var roomImageView3: UIImageView!
    
    func setRoomCell(for room : Room){
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        address1Label.text = room.printAdress1();
        adress2Label.text =  room.printAdress2();
        noOfBedsLabel.text = String(room.numberOfBedrooms);
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let p = numberFormatter.string(from: NSNumber(value: room.price));
        
        noOfBathsLabel.text = String(room.numberOfBathrooms);
        priceLabel.text = "$" + (p ?? "0") ;
        roomImageView1.image = room.images[0];
        roomImageView2.image = room.images[1];
        roomImageView3.image = room.images[2];
    }
    
    override func prepareForReuse() {
        super.prepareForReuse();
    }
}
