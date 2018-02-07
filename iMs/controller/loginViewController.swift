//
//  loginViewController.swift
//  iMs
//
//  Created by mohamed zead on 1/27/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD
class loginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var loginBtnView: UIButton!
    @IBAction func closeBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "closeVC", sender: self)
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil {
                var str_err = String(describing: error)
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
            else {
                
                self.performSegue(withIdentifier: "loggedin", sender: self)
                SVProgressHUD.dismiss()
                
            }
        }
        
    }
    func alertClose(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      loginBtnView.layer.cornerRadius = 10
    }

    @IBAction func createACCount(_ sender: Any) {
        performSegue(withIdentifier: "toCreateAccount", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "loggedin"
        {
             let channelVC = segue.destination as! ChannelViewController
            channelVC.loginbtn.setTitle("Logout", for: UIControlState.normal)
            channelVC.login = true
        }
        else if segue.identifier == " closeVC"
        {
             let channelVC = segue.destination as! ChannelViewController
            channelVC.loginbtn.setTitle("Login", for: UIControlState.normal)
        }
        
    }
    

}
