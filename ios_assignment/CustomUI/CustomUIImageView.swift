//
//  CustomUIImageView.swift
//  PhoneMed
//
//  Created by Thanuska Praveen on 18/7/18.
//  Copyright © 2018 Techlead International Pvt Ltd. All rights reserved.
//

import UIKit
import Kingfisher


@IBDesignable class CustomUIImageView: UIImageView {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
    
    func setImageView(img:String)  {
//        let url = URL(string: "http://lorempixel.com/200/200/cats/1/")
//        let image = UIImage(named: "paseholder")
//        kf.setImage(with: url, placeholder: image)
        setImage(from: img)
        
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let im = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = im
            }
        }
    }
}


