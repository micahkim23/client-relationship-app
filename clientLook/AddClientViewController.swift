//
//  AddClientViewController.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/21/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit
import os.log


class AddClientViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let clientModel = ClientModel()
    var client: Client?
    
    @IBOutlet weak var clientName: UITextField!
    
    @IBOutlet weak var clientEmail: UITextField!
    
    @IBOutlet weak var clientPhone: UITextField!
    @IBOutlet weak var clientBirthday: UIDatePicker!
    @IBOutlet weak var clientCustom: UITextField!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveBtn else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = clientName.text ?? ""
        let email = clientEmail.text ?? ""
        let phone = clientPhone.text ?? ""
        let birthday = clientBirthday.date
        let custom = clientCustom.text ?? ""
        client = Client(name: name, phone: phone, email: email, birthday: birthday as NSDate, custom: custom)
        //post to DB
        //create a new client in response
        
        //let clientID = clientModel.addItem(client!)
//        if(clientID != -1) {
//            client!.clientID = clientID
//        }
        
        
    }
    
    
    
    
        
}
