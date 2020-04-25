//
//  HotelnfoVC.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit

class HotelnfoVC: UIViewController {
    
    @IBOutlet weak var infoIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var disLbl: UILabel!
    
    var hotel:Hotel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(hotel?.image)
        titleLbl.text = hotel!.title ?? "No Title"
        disLbl.text = hotel!.dis ?? "No infomation"
        let paseholder = UIImage(named: "paseholder")!
        print(hotel!.image!.large)
        infoIV.setImageWithUrl(hotel!.image!.large ?? "", placeholderImage: paseholder)
    }
    

    @IBAction func didTapOnLocation(_ sender: Any) {
        self.performSegue(withIdentifier: "HotelInfoVCToMapVC", sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HotelInfoVCToMapVC" {
             let destination = segue.destination as! MapVC
            destination.hotel = self.hotel!
         }
    }
    

}
