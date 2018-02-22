//
//  avatarPickerViewController.swift
//  iMs
//
//  Created by mohamed zead on 2/12/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class avatarPickerViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {
   
    
    var type = collectionViewCellCollectionViewCell.avatarType.Dark
    var delegateProperty : delegate?
    //outlets
    @IBOutlet weak var collectionView: UICollectionView!
 
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
   
    @IBAction func SegmentedControlChanged(_ sender: Any) {
        if type == collectionViewCellCollectionViewCell.avatarType.Dark{
            type = collectionViewCellCollectionViewCell.avatarType.light
        }
        else{
           type = collectionViewCellCollectionViewCell.avatarType.Dark
        }
    }
    
    
    //collection View methods
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarIdentifier", for: indexPath) as? collectionViewCellCollectionViewCell{
            cell.configureCell(index: indexPath.item , type : type)
            return cell
        
        }
        else{return collectionViewCellCollectionViewCell()}
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       let cell =  collectionView.cellForItem(at: indexPath) as? collectionViewCellCollectionViewCell
        delegateProperty?.setChoosedImage(ImgName:(cell?.image.image)!)
        dismiss(animated: true, completion: nil)
       
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    }

    

    

