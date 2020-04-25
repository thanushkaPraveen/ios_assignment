//
//  CustomUIImageView.swift
//  PhoneMed
//
//  Created by Thanuska Praveen on 18/7/18.
//  Copyright © 2018 Techlead International Pvt Ltd. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import AlamofireImage

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
        let paseholder = UIImage(named: "paseholder")!
//        kf.setImage(with: url, placeholder: image)
        setImageWithUrl(img, placeholderImage: paseholder)
        
    }
}

extension UIImageView {
    func setImageWithUrl(_ urlString: String, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            self.af_setImage(withURL: url, placeholderImage: placeholderImage)
    
        }
    }
}

extension UIButton {
    func setImageWithUrl(_ urlString: String, isBackground: Bool = false, state: UIControl.State = .normal, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            switch isBackground {
            case true:
                self.af_setBackgroundImage(for: state, url: url, placeholderImage: placeholderImage)
            default:
                self.af_setImage(for: state, url: url, placeholderImage: placeholderImage)
            }
        }
    }
}


