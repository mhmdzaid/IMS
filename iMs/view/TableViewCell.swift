//
//  TableViewCell.swift
//  iMs
//
//  Created by mohamed zead on 2/3/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var messageAvatar: UIImageView!
    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var messagebody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
