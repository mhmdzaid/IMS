//
//  CreateAccountViewController.swift
//  iMs
//
//  Created by mohamed zead on 1/29/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import Firebase
import SVProgressHUD
class CreateAccountViewController: UIViewController, delegate {
   
    var bgcolor : UIColor?
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var createAccBtn: UIButton!
    
    
    
    func Check_Account(){
        if password.text == confirm_password.text {

            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion:{(user,error)in
                var str_err = String(describing: error)
                print(str_err)
               
                
                if error != nil
                {
                    
                    let inx1 = str_err.index(str_err.startIndex, offsetBy: 53)
                    let inx2 = str_err.index(of:".")
                    str_err = str_err[inx1...inx2]
                     SVProgressHUD.dismiss()
                    let alert = UIAlertController.init(title: "Error", message: str_err, preferredStyle: UIAlertControllerStyle.alert)
                    
                    self.present(alert, animated: true, completion:{
                        alert.view.superview?.isUserInteractionEnabled = true
                        alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertClose)))
                    })
                
                
                
                    
                }
                else{
                        self.performSegue(withIdentifier: "created", sender: nil)
                        SVProgressHUD.dismiss()
                }
            })
        }
        else {
            let alert : UIAlertController = UIAlertController.init(title: "Error", message: "password doesn't match ", preferredStyle: UIAlertControllerStyle.alert)
            
            self.present(alert, animated: true, completion:{
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertClose)))
            })
    
        }
 }
  
    func alertClose(){
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAccBtn.layer.cornerRadius = 10
        
        
        
        
    }
    
    
    @IBAction func createAccountButton(_ sender: Any) {
        
       
        SVProgressHUD.show()
        
        Check_Account()
        
    }
    

    @IBAction func chooseColor(_ sender: Any) {
       
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        bgcolor = UIColor(red: r, green: g, blue: b, alpha: 1)
        self.avatar.backgroundColor = bgcolor
    }
    @IBAction func chooseAvatar(_ sender: UIButton) {
        performSegue(withIdentifier: "toAvatarPicker", sender: self)
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "created"
        {
            let channelVC = segue.destination as! ChannelViewController
            channelVC.loginbtn.setTitle("Logout", for: UIControlState.normal)
            channelVC.login = true
        }
        else if segue.identifier == "unwindSegue"
        {
            let channelVC = segue.destination as! ChannelViewController
            channelVC.loginbtn.setTitle("Login", for: UIControlState.normal)

        }
    else if segue.identifier == "toAvatarPicker"
        {
            let avatarPicker = segue.destination as? avatarPickerViewController
            avatarPicker?.delegateProperty = self
            
            
        }
    }
  
    @IBAction func closepressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    
    //delegate func to send selected avatar
    func setChoosedImage(ImgName Img: UIImage) {
        self.avatar.image = Img
    }
}
