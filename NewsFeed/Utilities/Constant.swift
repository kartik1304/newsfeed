//
//  Constant.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import UIKit

struct STORYBOARD {
    static let Main                      = UIStoryboard(name : "Main", bundle : Bundle.main)
    static let Home                      = UIStoryboard(name : "Home", bundle : Bundle.main)
}

//MARK: - Global Variables
let isAppInTestMode                      = true // true or false
let APPLICATION_NAME                     = "NewsFeed"
let DEVICE_UNIQUE_IDETIFICATION : String = UIDevice.current.identifierForVendor!.uuidString
let appDelegate                          = UIApplication.shared.delegate as! AppDelegate
let userDefaults                         = UserDefaults.standard
let USER_DATA                            = "user_data"
let serverUrl                            = "https://climate-news-feed.p.rapidapi.com/"
let PER_PAGE_LIMIT                       = 10



//MARK: - Get file Name
func getFileName() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMddHHmmss"
    return dateFormatter.string(from: Date())
}

//MARK: - URl
//let newFeedURL = "page/1?limit=10"
