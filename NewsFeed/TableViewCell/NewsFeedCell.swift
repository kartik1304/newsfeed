//
//  NewsFeedCell.swift
//  NewsFeed
//
//  Created by iMac on 27/06/23.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        mainView.layer.cornerRadius = 12
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var item : NewsFeedResponse? {
        didSet {
            Utility.setImage(item?.thumbnail, imageView: profileImageView)
            userNameLabel.text = item?.source
            subTitleLabel.text = item?.title
            
            createTimeLabel.text = Utility.changeDateFormate(date: item?.published ?? "", dateForamte: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", getFormate: "MM.dd.yyyy - hh:mm a")
        }
    }
    
}
