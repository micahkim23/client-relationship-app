//
//  Order.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/22/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit

class Order: NSObject  {
    
    var orderID: Int
    var brand: String
    var itemName: String
    var orderTime: NSDate
    var price: Double
    var assocName: String
    var imageURL: String
    //var sku: CUnsignedLongLong
    
    init(orderID: Int, brand: String, itemName: String, orderTime: NSDate, price: Double, assocName: String, imageURL: String?="https://unsplash.it/100/150/?random") {
        self.orderID = orderID
        self.brand = brand
        self.itemName = itemName
        self.orderTime = orderTime
        self.price = price
        self.assocName = assocName
        self.imageURL = imageURL!
    }
    
}
