//
//  ResponseModel.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import ObjectMapper

class LogInResponse: Mappable {
    var auth: Auth?
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        auth <- map["access_token"]
    }
}

class Auth: Mappable {
    
    var tokenType: String?
    var expiresIn: NSNumber?
    var accessToken: String?
    var refreshToken: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
    }
}


class NewsFeedResponse : Mappable {
    var title: String?
    var url : String?
    var thumbnail: String?
    var published: String?
    var source: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        url <- map["url"]
        thumbnail <- map["thumbnail"]
        published <- map["published"]
        source <- map["source"]
    }
}

class Meta: Mappable {
    var totalArticles: Int?
    var currentPage: Int?
    var totalPages: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        totalArticles <- map["totalArticles"]
        currentPage <- map["currentPage"]
        totalPages <- map["totalPages"]
    }
}
