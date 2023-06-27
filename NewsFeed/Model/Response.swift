//
//  Response.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import ObjectMapper

class Response: Mappable {
    
    var success: String?
    var message: String?
    var error: String?
    var msg:String?
    var newsFeedResponse: [NewsFeedResponse]?
    var meta: Meta?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        msg <- map["msg"]
        error <- map["error"]
        newsFeedResponse <- map["articles"]
        meta <- map["meta"]
       
    }
}
