//
//  ChannelViewController.swift
//  iMs
//
//  Created by mohamed zead on 1/26/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    let sections = ["News","sport","chat","About Us"]
    @IBOutlet weak var tableview: UITableView!
    var login = false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if login == true {
        switch indexPath.row{
        case 0 :
            break
        case 1 :
            break
        case 2 :
            performSegue(withIdentifier: "toChat", sender: self)
            break
        case 3 :
            break
            
        default:
            print("Error")
        }
        
    }
        else {
            let alert = UIAlertController.init(title: "LOGIN", message:"please Login first ", preferredStyle: UIAlertControllerStyle.alert)
            
            self.present(alert, animated: true, completion:{
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertClose)))
            })
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "custom", for: indexPath)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = sections[indexPath.row]
        return cell
    }
    
    
    @IBAction func prepareforUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var loginbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width-80
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if loginbtn.titleLabel?.text == "Logout"{
            loginbtn.setTitle("Login", for: UIControlState.normal)
            login = false
        }
        
        
    }
    func alertClose(){
      self.dismiss(animated: true, completion: nil)
    }/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
