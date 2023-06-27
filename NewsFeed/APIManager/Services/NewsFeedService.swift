//
//  NewsFeedService.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import Alamofire

class NewsFeedService{
    static let shared = {NewsFeedService()}()
    
    //MARK: - Venue List Api
    func newsFeedList(urlString: String,success: @escaping (Int, Response) -> (), failure: @escaping (String) -> ()){
        APIManager.shared.requestAPIWithGetMethod(method: .get, urlString: urlString){ statusCode, response in
            success(statusCode,response)
        } failure: { error in
            failure(error)
        }
    }
}
