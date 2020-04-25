//
//  BaseResponse.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit

struct BaseResponse<T: Codable>: Codable{
    var status:Int = 1
    var retMsg:String?
    var data:[T]?
    
    public func isSuccess() -> Bool{
        return status == 200
    }
}
