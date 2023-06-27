//
//  HomeScreen.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBOutlet weak var newFeedTableView: UITableView! {
        didSet {
            newFeedTableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
            newFeedTableView.delegate = self
            newFeedTableView.dataSource = self
        }
    }
    
    //MARK: - Variable
    var newsFeedListArray = [NewsFeedResponse]()
    var meta:Meta?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialDetail()
        
    }
    
    //MARK: - Setup InitialDetail
    func setUpInitialDetail(){
        newsFeedApi(page: 1)
    }
    
}

//MARK: - UITableViewDelegate
extension HomeScreen : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as? NewsFeedCell {
            cell.item = newsFeedListArray[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.newsFeedListArray.count - 2
        if indexPath.row == lastItem {
            print("IndexRow\(indexPath.row)")
            if page < meta?.totalPages ?? 0 {
                page += 1
                self.newsFeedApi(page: page)
            }
        }
    }
    
}

//MARK: - API
extension HomeScreen {
    func newsFeedApi(page:Int){
        if Utility.isInternetAvailable(){
            //Utility.showIndicator()
            let url = "\(serverUrl)page/\(page)?limit=\(PER_PAGE_LIMIT)"
            NewsFeedService.shared.newsFeedList(urlString: url){ (statusCode, response) in
                Utility.hideIndicator()
               // self.hasMorePage = true
                if let res = response.newsFeedResponse {
                    if self.page == 1{
                        self.newsFeedListArray.removeAll()
                        self.newsFeedListArray = res
                        self.newFeedTableView.isHidden = false
                        self.newFeedTableView.reloadData()
                    } else {
                        self.appendDataCollectionView(data: response)
                    }
                    if let meta = response.meta{
                        self.meta = meta
                    }
                }
                
            } failure: {[weak self] (error) in
                guard let selfScreen = self else {return}
                //Utility.hideIndicator()
                Utility.showAlert(vc: selfScreen, message: error)
            }
        }else{
            Utility.hideIndicator()
            Utility.showNoInternetConnectionAlertDialog(vc: self)
        }
    }
    
    func appendDataCollectionView(data: Response){
        var indexPathArray: [IndexPath] = []
        if let res = data.newsFeedResponse {
            for i in self.newsFeedListArray.count..<self.newsFeedListArray.count + res.count{
                indexPathArray.append(IndexPath(item: i, section: 0))
            }
            self.newsFeedListArray.append(contentsOf: res )
            self.newFeedTableView.insertRows(at: indexPathArray, with: .automatic)
        }
    }
}
