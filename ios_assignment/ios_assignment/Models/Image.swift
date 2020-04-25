//
//  Image.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import ObjectMapper


class Image: NSObject, Codable, Mappable {
    
    var small:String?
    var medium:String?
    var large:String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        
        small     <- map["small"]
        medium    <- map["medium"]
        large     <- map["large"]
        
    }
    
}
