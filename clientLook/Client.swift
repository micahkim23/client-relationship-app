//
//  Client.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/21/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//
import UIKit

class Client {
    
    //MARK: Properties
    
    var name: String
    //var photo: UIImage?
    var phone: String
    var email: String
    var birthday: NSDate
    var clientID: Int
    
    init(name: String, phone: String, email: String, birthday: NSDate, clientID: Int) {
        self.name = name
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.clientID = clientID
        
    }
    
    
    
}
