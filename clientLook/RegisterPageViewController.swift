//
//  RegisterPageViewController.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/20/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        let userEmail = email.text
        let userName = name.text
        let userPhone = phone.text
        let userPassword = password.text
        
        //check empty fileds
        if((userEmail?.isEmpty)! || (userName?.isEmpty)! || (userPhone?.isEmpty)! || (userPassword?.isEmpty)!) {
            //display alert
            return;
        }
        
//        let json: [String: Any] = ["email": userEmail,
//                                   "name": userName,
//                                   "phone": userPhone,
//                                   "password": userPhone
//        ]
//        
//        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        //store
        var request = URLRequest(url: URL(string: "https://posttestserver.com/post.php")!)
        request.httpMethod = "POST"
        let postString = "email=\(userEmail)&name=\(userName)&phone=\(userPhone)&password=\(userPassword)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
        
    }
    
//    func displayMyAlertMessage(userMessage:String) {
//        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
//        let okAction = UIAlertController(title:"Ok", message: UIAlertActionStyle.default, preferredStyle: nil)
//        
//        myAlert.addAction(okAction)
//        self.presentedViewController(myAlert, animated: true, comletion: nil)
//        
//    }
    
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

}
