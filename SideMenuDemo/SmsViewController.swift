//
//  SmsViewController.swift
//  SideMenuDemo
//
//  Created by prakash on 12/11/17.
//  Copyright © 2017 prakash. All rights reserved.
//

import UIKit

class SmsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    let smsImage = ["mbltop","mblbank","Utt"]
    let LabelName = ["mobile TopUp","Mobile Banking","Utility payment"]

    override func viewDidLoad() {
        super.viewDidLoad()

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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smsImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmsCell", for: indexPath) as! SmsCell
        Cell.SmsImageView.image = UIImage(named: smsImage[indexPath.row])
        Cell.SmsLabel.text = LabelName[indexPath.row]
        return Cell
    
    }
    

}
