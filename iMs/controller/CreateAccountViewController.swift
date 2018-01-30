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
class CreateAccountViewController: UIViewController {
   
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    func Check_Account(){
        if password.text == confirm_password.text {

            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion:{(user,error)in

                if error != nil {print(error!)}
                else{print("successfully registered")}
            })
        }
        else {
            let alert : UIAlertController = UIAlertController.init(title: "Error", message: "password doesn't match ", preferredStyle: UIAlertControllerStyle.alert)
            
          present(alert, animated: true, completion: nil)
            alert.dismiss(animated: true, completion: {self.password.text = ""
                self.confirm_password.text = ""
            })
    
        }
 }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountButton(_ sender: Any) {
        Check_Account()
        
    }
    

    @IBAction func chooseColor(_ sender: Any) {
        
    }
    @IBAction func chooseAvatar(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closepressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
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
