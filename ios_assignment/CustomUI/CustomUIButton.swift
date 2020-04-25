//
//  CustomUIButton.swift
//  PhoneMed
//
//  Created by Thanuska Praveen on 18/7/18.
//  Copyright © 2018 Techlead International Pvt Ltd. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIButton: UIButton {

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
}
