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
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: Error?)
    {
        if error != nil{
            print("Failed to download data")
        }
    }
    
}
