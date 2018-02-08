//
//  chatViewController.swift
//  iMs
//
//  Created by mohamed zead on 1/26/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import IBAnimatable
class chatViewController: UIViewController ,UIScrollViewDelegate{

    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var chatImg: AnimatableImageView!
    @IBOutlet weak var sportImg: AnimatableImageView!
    @IBOutlet weak var newImg: AnimatableImageView!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollview.delegate = self
        chatImg.layer.cornerRadius = 30
        chatImg.layer.masksToBounds =  true
        sportImg.layer.cornerRadius = 30
        sportImg.layer.masksToBounds = true
        newImg.layer.cornerRadius = 30
        newImg.layer.masksToBounds = true
             btn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:.touchUpInside )
    
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        chatImg.animate(.squeezeFade(way: .in, direction: .left))
        sportImg.animate(.squeezeFade(way: .in, direction: .left))
        newImg.animate(.squeezeFade(way: .in, direction: .left))

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
