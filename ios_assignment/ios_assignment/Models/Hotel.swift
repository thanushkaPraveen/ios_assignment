//
//  Hotel.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class Hotel: NSObject, Codable, Mappable  {

    var id:String?
    var title:String?
    var dis:String?
    var address:String?
    var postcode:String?
    var phoneNumber:String?
    var latitude:String?
    var longitude:String?
    var image:Image?
//    var image:Image?
    
    
    func getHotel(data:Data) -> BaseResponse<Hotel> {
       do {
           let decoder = JSONDecoder()
           return try decoder.decode(BaseResponse.self , from: data) // var response:BaseResponse<User> = try decoder.decode(BaseResponse.self , from: data)
       } catch  {
           print(error)
       }
       return BaseResponse()
   }
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        
        id           <- map["id"]
        title        <- map["title"]
        dis          <- map["description"]
        address      <- map["address"]
        postcode     <- map["postcode"]
        phoneNumber  <- map["phoneNumber"]
        latitude     <- map["latitude"]
        longitude    <- map["longitude"]
        image        <- map["image"]
        
    }
    
    class func mapHotelData(json: JSON) -> [Hotel] {
        print("HOTEL LIST JSON:\(json)")
        var hotelArray:[Hotel] = []
        
        let hotelJsonArray = json["data"].arrayValue
        for hotelJson in hotelJsonArray {
            if let organization = Mapper<Hotel>().map(JSONObject: hotelJson.rawValue) {
                hotelArray.append(organization)
            }
        }
        return hotelArray
    }
}
 
