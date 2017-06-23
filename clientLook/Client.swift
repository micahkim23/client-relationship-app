//
//  Client.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/21/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//
import UIKit

class Client: NSObject {
    
    //MARK: Properties
    
    var name: String?
    //var photo: UIImage?
    var phone: String?
    var email: String?
    var birthday: NSDate?
    var clientID: Int?
    var custom: String?
    
    override init()
    {
        
    }
    
    init(name: String, phone: String, email: String, birthday: NSDate, custom: String? = "", clientID: Int? = -1) {
        self.name = name
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.custom = custom!
        self.clientID = clientID!
    }
    
    func describe() {
        let bday = birthday?.toString(dateFormat: "yyyy-MM-dd")
        print("name=\(name), phone=\(phone), email=\(email), birthday=\(bday), clientID=\(clientID), custom=\(custom))")
    }
    
    
    
}
