//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by prakash on 12/10/17.
//  Copyright © 2017 prakash. All rights reserved.
//
import UIKit
import LGSideMenuController
//import XLPagerTabStrip

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      // programmatically add bar button
       self.navigationController?.navigationBar.backgroundColor = .green
        let btn = UIButton(frame: CGRect(x: 2, y: 4, width: 60 , height: 60))
        let bar = UIBarButtonItem(customView: btn)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(self.showVC), for: .touchUpInside)
       // btn.setTitle("Test", for: .normal)
        btn.setImage(#imageLiteral(resourceName: "bar"), for: .normal)
        self.navigationItem.leftBarButtonItems = [bar]
    }
    
    @objc func showVC(){
        print("show menu")
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



