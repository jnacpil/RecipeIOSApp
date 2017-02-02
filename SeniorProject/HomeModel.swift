//
//  HomeModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 1/26/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation

protocol HomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data: NSMutableData = NSMutableData()
    
    let urlPath: String = "http://jnacpil.create.stedwards.edu/service.php"
    
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
        let markets: NSMutableArray = NSMutableArray()
        
        for i in 0..<(jsonResult.count)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            let market = LocationModel()
            
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
            
            market.mID = jsonElement["mID"] as? Int
            market.mName = jsonElement["mName"] as? String
            market.mAddress = jsonElement["mAddress"] as? String
            market.mLatitude = jsonElement["mLatitude"] as? String
            market.mLongitude = jsonElement["mLongitude"] as? String
            market.mType = jsonElement["mType"] as? Int
            
            markets.add(market)
        }
        
        //dispatch_async(dispatch_get_main_queue(), {() -> Void in
          //  self.delegate.itemDownloaded(locations)
        //})
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.itemsDownloaded(items: markets)
            })
        
        print(jsonResult)
        //self.delegate.itemsDownloaded(items: markets)
    }
    
    
    
}
