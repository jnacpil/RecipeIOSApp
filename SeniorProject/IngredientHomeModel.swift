//
//  IngredientHomeModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/9/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation

protocol IngredientHomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class IngredientHomeModel: NSObject, URLSessionDataDelegate {
    
    
    //properties
    
    weak var delegate: IngredientHomeModelProtocal!
    
    var data: NSMutableData = NSMutableData()
    
    let urlPath: String = "http://jnacpil.create.stedwards.edu/recipeingredients.php"
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: url as URL)
        
        task.resume()
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    {
        self.data.append(data as Data)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
    {
        if error != nil{
            print("Failed to download data")
        }
        else
        {
            print("Data downloaded")
            self.parseJSON()
        }
    }
    func parseJSON(){
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            //jsonResult = try JSONSerialization.JSONObjectWithData(self.data, options:NSJONReadingOptions.  AllowFragments) as! NSMutableArray
            jsonResult = try (JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments)as! NSArray).mutableCopy() as! NSMutableArray
            
            
        } catch let error as NSError{
            print(error)
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let ingredients: NSMutableArray = NSMutableArray()
        
        for i in 0..<(jsonResult.count)
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let ingredient = IngredientModel()
            
            //the following insures none of the jsonelemnt calues are nil through option binding
            /*if let id = jsonElement["Id"] as? Int,
             let name = jsonElement["Name"] as? String,
             let address = jsonElement["Address"] as? String,
             let latitude = jsonElement["Latitude"] as? String,
             let longitude = jsonElement["Longitude"] as? String,
             let type = jsonElement["Type"] as? Int
             {
             market.id = id
             market.name = name
             market.latitude = latitude
             market.longitude = longitude
             market.type = type
             
             }*/
            
            ingredient.iID = jsonElement["iID"] as? String
            ingredient.rID = jsonElement["rID"] as? String
            ingredient.iName = jsonElement["iName"] as? String
            ingredient.availAmount = jsonElement["availAmount"] as? String
            ingredient.iUnit = jsonElement["iUnit"] as? String
            ingredient.uName = jsonElement["uName"] as? String
            
            ingredients.add(ingredient)
            
        }
        
        //dispatch_async(dispatch_get_main_queue(), {() -> Void in
        //  self.delegate.itemDownloaded(locations)
        //})
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.itemsDownloaded(items: ingredients)
        })
        
        print(jsonResult)
        //self.delegate.itemsDownloaded(items: markets)
    }
    
    
    
}
