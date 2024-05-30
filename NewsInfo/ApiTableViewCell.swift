//
//  ApiTableViewCell.swift
//  NewsInfo
//
//  Created by Praveen on 16/05/24.
//

import UIKit

class ApiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    
    //var likeButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    @IBAction func btnActionInLike(_ sender: UIButton) {
        
//        likeButtonAction?()
        
                if sender.tintColor == UIColor.black {

                        sender.tintColor = UIColor.red

                  } else {
                       sender.tintColor = UIColor.black
                  }

  
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
