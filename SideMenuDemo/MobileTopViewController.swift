//
//  MobileTopViewController.swift
//  SideMenuDemo
//
//  Created by prakash on 12/11/17.
//  Copyright © 2017 prakash. All rights reserved.
//

import UIKit

class MobileTopViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    let InternetImage = ["mbltop","mblbank","utt","recha"]
    let LabelName = ["Mobile TopUp","Mobile Banking","Utility Payment","Recharge PIN"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
    return InternetImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InternetImageCell", for: indexPath) as! InternetImageCell
        Cell.ImageView.image = UIImage(named:InternetImage[indexPath.row])
        Cell.Label.text = LabelName[indexPath.row]
        return Cell
        
    }
    
}
