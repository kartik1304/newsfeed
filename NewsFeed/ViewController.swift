//
//  ViewController.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialDetail()
    }

    //MARK: - Setup InitialDetail
    func setUpInitialDetail(){
        if let vc = STORYBOARD.Home.instantiateViewController(withIdentifier: "HomeScreen") as? HomeScreen {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

