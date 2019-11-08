//
//  RoomsTableViewController.swift
//  Roomy
//
//  Created by Yehia Samak on 11/6/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class RoomsTableViewController: UIViewController {
    
    var rooms : [Room] = [];
    @IBOutlet weak var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRooms();
        roomsTableView.delegate = self;
        roomsTableView.dataSource = self;
        hideNavBar();
    }
    func hideNavBar(){
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
         self.navigationController!.navigationBar.shadowImage = UIImage()
         self.navigationController!.navigationBar.isTranslucent = true
    }
    
    func setRooms(){
        rooms.append(Room(buldingNo: 35, streetName: "Pierrepont St", city: "Brooklyn", country: "NY", zipCode: "11236", hastag: "C7", images: [UIImage(named: "Rectangle Copy")!, UIImage(named: "Rectangle Copy 2")!, UIImage(named: "Rectangle Copy 3")!], numberOfBedrooms: 2, numberOfBathrooms: 1, mainPhoto: UIImage(named: "image")!, price : 2500));
        rooms.append(Room(buldingNo: 86, streetName: "Gerrymain Rd", city: "New York", country: "NY", zipCode: "11253", hastag: "F3", images: [UIImage(named: "Rectangle Copy 4")!, UIImage(named: "Rectangle Copy 5")!, UIImage(named: "Rectangle Copy 6")!], numberOfBedrooms: 1, numberOfBathrooms: 1, mainPhoto: UIImage(named: "image")!, price : 1250));
        rooms.append(Room(buldingNo: 22, streetName: "Yonker St", city: "Queens", country: "NY", zipCode: "11539", hastag: "C7", images: [UIImage(named: "Rectangle Copy 7")!, UIImage(named: "Rectangle Copy 8")!, UIImage(named: "Rectangle Copy 9")!], numberOfBedrooms: 3, numberOfBathrooms: 2, mainPhoto: UIImage(named: "image")!, price : 4200));
    }
   

}
extension RoomsTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myRoom = rooms[indexPath.row];
        let myCell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as! RoomTableViewCell;
        myCell.setRoomCell(for: myRoom);
        return  myCell;
    }
    
}

