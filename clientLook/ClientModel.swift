//
//  ClientModel.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/22/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit
protocol ClientModelProtocol: class {
    func getClient(items: NSMutableArray)
    func getOrderHistory(items: NSMutableArray)
}

class ClientModel: NSObject {
    weak var delegate: ClientModelProtocol!
    
    let urlPath = "http://localhost:8080/api/client?associateId=1" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error!)
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func addItem(_ client: Client) -> Int {
        
        let dict = ["email": client.email, "name": client.name, "phone": client.phone, "birthday": client.birthday?.toString(dateFormat: "yyyy-MM-dd"), "associate_id": 1] as [String: Any]
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) {

            var request = URLRequest(url: URL(string: "http://localhost:8080/api/client")!)
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
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
                self.downloadItems()
            }
            task.resume()
        }
        return -1
        
    }
    
    func updateItem(_ client: Client) -> Int {
        client.describe()
        let dict = ["email": client.email, "name": client.name, "phone": client.phone, "birthday": client.birthday?.toString(dateFormat: "yyyy-MM-dd"), "client_id": client.clientID] as [String: Any]
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) {
            
            var request = URLRequest(url: URL(string: "http://localhost:8080/api/client")!)
            request.httpMethod = "PUT"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
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
                self.downloadItems()
            }
            task.resume()
        }
        return -1
        
    }
    
    
    func parseJSON(_ data:Data) {
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let clients = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let client = Client()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["name"] as? String,
                let phone = jsonElement["phone"] as? String,
                let email = jsonElement["email"] as? String,
                let birthday = jsonElement["birthday"] as? String,
                let clientID = jsonElement["clientId"] as? Int
            {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"//this your string date format
                let index = birthday.index(birthday.startIndex, offsetBy: 10)
                let date = dateFormatter.date(from: birthday.substring(to: index))
                client.name = name
                client.phone = phone
                client.email = email
                client.birthday = date as! NSDate
                client.clientID = clientID
                
            }
            
            clients.add(client)
           
        }
        print("count \(clients.count)")
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.getClient(items: clients)
            
        })
    }


}
