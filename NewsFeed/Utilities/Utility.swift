//
//  Utility.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import Foundation
import UIKit
import SDWebImage

class Utility: NSObject {
    class func showIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            SwiftLoader.show(title: "Loading...", imageName: "", animated: true)
        }
    }

    class func hideIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            SwiftLoader.hide()
        }
    }
    
    class func saveUserData(data: [String: Any]){
        UserDefaults.standard.setValue(data, forKey: USER_DATA)
    }

    class func removeUserData(){
        UserDefaults.standard.removeObject(forKey: USER_DATA)
    }
    
    class func getUserData() -> LogInResponse?{
        if let data = UserDefaults.standard.value(forKey: USER_DATA) as? [String: Any]{
            let dic = LogInResponse(JSON: data)
            return dic
        }
        return nil
    }

    class func getAccessToken() -> String?{
        if let token = getUserData()?.auth?.accessToken {
            return token
        }
        return nil
    }
    
    class func isInternetAvailable() -> Bool
    {
        var  isAvailable : Bool
        isAvailable = true
        let reachability = try? Reachability() //try? Reachability(hostname: "google.com") //Reachability()
        if(reachability?.connection == Reachability.Connection.unavailable)
        {
            isAvailable = false
        }
        else
        {
            isAvailable = true
        }

        return isAvailable

    }
    
    class func clearNotifications(){
        UIApplication.shared.applicationIconBadgeNumber = 0 // For Clear Badge Counts
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    class func showAlert(vc: UIViewController, message: String) {
        let alertController = UIAlertController(title: APPLICATION_NAME, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title:  "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    class func showNoInternetConnectionAlertDialog(vc: UIViewController) {

        let alertController = UIAlertController(title: APPLICATION_NAME, message: "It seems you are not connected to the internet. Kindly connect and try again", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: /*Utility.getLocalizdString(value: */"OK"/*)*/, style: .default, handler: nil)
        alertController.addAction(OKAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    class func setImage(_ imageUrl: String!, imageView: UIImageView!) {
        
        if imageUrl != nil && !(imageUrl == "") {
            imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imageView!.sd_setImage(with: URL(string: imageUrl! ), placeholderImage: UIImage(named: "image_placeholder"))
        }
        else {
            imageView?.image = UIImage(named: "image_placeholder")
        }
    }
    
    class func changeDateFormate(date:String,dateForamte:String,getFormate:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateForamte //"yyyy/MM/dd"
        let date = dateFormatter.date(from: date) ?? nil
        dateFormatter.dateFormat = getFormate //"MM/dd"
        let resultString = dateFormatter.string(from: date!)
        print(resultString)
        return resultString
    }
    
}


