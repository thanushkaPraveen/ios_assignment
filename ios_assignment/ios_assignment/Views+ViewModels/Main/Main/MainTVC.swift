//
//  MainTVC.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import Kingfisher

class MainTVC: UITableViewCell {
    
    @IBOutlet weak var roundIv: CustomUIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(hotel:Hotel) {
        print(hotel.image!.large)
        roundIv.setImageView(img: hotel.image!.small!)
        titleLbl.text = hotel.title
        addressLbl.text = hotel.address
    }

}
