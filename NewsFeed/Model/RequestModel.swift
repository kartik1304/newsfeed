//
//  RequestModel.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import ObjectMapper


class NewsFeedRequest: Mappable {

    var id: Int?

    init(id: Int) {
        self.id = id
    }
    
    required init?(map: Map){
    }

    func mapping(map: Map) {
        id <- map["id"]
    }
}
