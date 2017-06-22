//
//  ClientDetailViewController.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/21/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit
import os.log
extension NSDate
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
    
}

class ClientDetailViewController: UIViewController, UINavigationControllerDelegate {
    var client: Client?
    
    
    
    
    @IBOutlet weak var clientEmail: UITextField!
    @IBOutlet weak var clientName: UITextField!
    @IBOutlet weak var clientBirthday: UITextField!
    @IBOutlet weak var clientCustom: UITextField!
    @IBOutlet weak var clientPhone: UITextField!
    
    @IBOutlet weak var updateBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        clientName.text = client?.name
        clientPhone.text = client?.phone
        clientBirthday.text = client?.birthday.toString(dateFormat: "yyyy-MM-dd")
        clientEmail.text = client?.email
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === updateBtn else {
            os_log("The update button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        client?.name = clientName.text ?? ""
        client?.email = clientEmail.text ?? ""
        client?.phone = clientPhone.text ?? ""
        client?.custom = clientCustom.text ?? ""
        
        //post to DB
        //create a new client in response
        
        //client = Client(name: name, phone: phone, email: email, birthday: birthday as NSDate, clientID: 99);
        

    }
    

}
