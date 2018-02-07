//
//  messagingVCViewController.swift
//  iMs
//
//  Created by mohamed zead on 2/3/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseCore

class messagingVCViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
   
    var messages : [message] = [message]()
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "customed", for: indexPath) as! TableViewCell
        
        cell.messagebody.text = messages[indexPath.row].messagebody
        cell.messagebody.textColor = UIColor.white
        cell.sender.text = messages[indexPath.row].Sender
        cell.sender.textColor = UIColor.red
        cell.messageBackground.layer.cornerRadius = 15.0
        if Auth.auth().currentUser?.email == cell.sender.text {
            cell.messageBackground.backgroundColor = #colorLiteral(red: 0.9973747134, green: 0.4345071912, blue: 0, alpha: 1)
            
        }
        else
        {
            cell.messageBackground.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            
        }
        
        return cell
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    @IBAction func sendBTN(_ sender: Any) {
        textfielld.endEditing(true)
        textfielld.isEnabled = false
        
        let MessageDB = Database.database().reference().child("Messages ")
        let messageDictionary = ["Sender":Auth.auth().currentUser?.email,"MessageBody":textfielld.text]
        MessageDB.childByAutoId().setValue(messageDictionary) { (error, ref) in
            if error != nil {
               // print(error!)
            }
            else{
                
                print("message saved successfully  ")
                
                self.textfielld.isEnabled = true
                self.sendBtn.isEnabled = true
                self.textfielld.text = ""
            }
        }
        
    }
    
    
    
    
    func retrieveMessages()
    {
        let MESSAGEDB = Database.database().reference().child("Messages ")
        
        MESSAGEDB.observe(.childAdded, with: {(snapshot) in
                let snapshotValue = snapshot.value as! Dictionary <String,String>
            let text = snapshotValue["MessageBody"]
            let sender = snapshotValue["Sender"]
            let msg = message()
            msg.Sender = sender!
            msg.messagebody = text!
            
            self.messages.append(msg)
            self.configureTableView()
            self.tableview.reloadData()
        })
    
        
    }
    

    
    

    
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var textfielld: UITextField!
    @IBOutlet weak var tableview: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myDB = Database.database().reference().child("Messages ")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.textfielld.delegate = self
        self.sendBtn.layer.cornerRadius = 10.0
        tableview.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier: "customed")
        configureTableView()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableviewTapped))
        
        tableview.addGestureRecognizer(tap)
       retrieveMessages()
    }
    
    func tableviewTapped(){
        textfielld.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.viewHeight.constant = 107
            self.view.layoutIfNeeded()
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.viewHeight.constant = 357
       self.view.layoutIfNeeded()
    }

    
  
    func configureTableView(){
        
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 120.0
//        if messages.count > 2
//        {
//            let index = IndexPath(row: (messages.count)-1, section: 0)
//            tableview.scrollToRow(at: index, at: .middle, animated: true)
//        }
    }

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
