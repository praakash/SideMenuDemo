//
//  LoginViewController.swift
//  SideMenuDemo
//
//  Created by prakash on 12/11/17.
//  Copyright © 2017 prakash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var User_Input: UITextField!
    @IBOutlet weak var User_Pin: UITextField!
    
    @IBOutlet weak var Submitbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func BtnClicked(_ sender: Any) {
        let email : String = self.User_Input.text!
        let password : String = self.User_Pin.text!
        let postString = ["email":email, "password": password]
        var request = URLRequest(url:URL(string:"http://192.168.40.50:82/demat/api/login")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application-idValue", forHTTPHeaderField: "secret-key")
        request.httpBody = try! JSONSerialization.data(withJSONObject: postString, options:.prettyPrinted)
        let session = URLSession.shared
        //Post
        session.dataTask(with: request){data, response, err in
            //Guard: ws there error ?
            guard(err == nil) else {
                print("\(String(describing: err))")
                return
            }
            //Guard: check was any data returned?
            guard let data = data else{
                print("no data return")
                return
            }
            //Convert Json to Object
            let parseResult: [String:AnyObject]!
            do{
                parseResult = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as! [String:AnyObject]
                print("\(parseResult)")
            } catch {
                print("Could not parse data as Json \(data)")
                return
            }
            //Check jsonDictionary
            guard let jsonArray = parseResult["success"] as? [String:AnyObject] else{
                print("jsonDictionary error")
                return
            }
            //check jsonArray and switch to LoginViewController
            if(jsonArray.count == 0 ){
                print("jsonArray not found")
                return
            } else{
                DispatchQueue.main.async{
                    let loginvc = LoginViewController()
                    self.present(loginvc, animated: true, completion: nil)
                    print(jsonArray)
                }
            }
        }
            .resume()
    }
}
        

