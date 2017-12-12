//
//  MenuViewController.swift
//  SideMenuDemo
//
//  Created by prakash on 12/10/17.
//  Copyright © 2017 prakash. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var Label: UILabel!
    
    var menus = ["DashBoard", "Transaction History","Notiification History"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
        cell.menuLabel.text = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.sideMenuController?.hideLeftView()
        
        
        if indexPath.row == 0 {
            let dashBoard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            self.sideMenuController?.rootViewController = dashBoard
        }
        
        if indexPath.row == 1 {
            
            let transactionHistory = self.storyboard?.instantiateViewController(withIdentifier: "TransactionHistoryViewController")
            self.sideMenuController?.rootViewController = transactionHistory
            }
        if indexPath.row == 2 {
            
            let NotificationHistory = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController")
            self.sideMenuController?.rootViewController = NotificationHistory
        }
    }
}

