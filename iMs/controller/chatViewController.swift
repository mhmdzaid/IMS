//
//  chatViewController.swift
//  iMs
//
//  Created by mohamed zead on 1/26/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class chatViewController: UIViewController {

    
    @IBOutlet weak var chatImg: UIImageView!
    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var newImg: UIImageView!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatImg.layer.cornerRadius = 30
        chatImg.layer.masksToBounds =  true
        sportImg.layer.cornerRadius = 30
        sportImg.layer.masksToBounds = true
        newImg.layer.cornerRadius = 30
        newImg.layer.masksToBounds = true
        btn.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)), for:.touchUpInside )
    
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
      // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
