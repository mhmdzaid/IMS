//
//  collectionViewCellCollectionViewCell.swift
//  iMs
//
//  Created by mohamed zead on 2/12/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class collectionViewCellCollectionViewCell: UICollectionViewCell {
    enum avatarType{
    case Dark
    case light
    
    }
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewCell()
    }
    
    
    
    func configureCell(index : Int,type : avatarType ){
        
        if type == avatarType.Dark {
            self.image.image =  UIImage(named:"dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else{
            self.image.image =  UIImage(named:"light\(index)")
                 self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
    }
    func setupViewCell(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    
}
