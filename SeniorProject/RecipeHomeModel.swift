//
//  RecipeHomeModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/9/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation


protocol RecipeHomeModelProtocal: class {
    func recipesDownloaded(items: NSArray)
}


class RecipeHomeModel: NSObject, URLSessionDataDelegate {
    
    
    //properties
    
    weak var delegate: RecipeHomeModelProtocal!
    
    var data: NSMutableData = NSMutableData()
    
    let urlPath: String = "http://jnacpil.create.stedwards.edu/recipes.php"
    
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
        let recipes: NSMutableArray = NSMutableArray()
        
        for i in 0..<(jsonResult.count)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            let recipe = RecipeModel()
            
            //the following insures none of the jsonelemnt calues are nil through option binding
            
            
            recipe.rID = jsonElement["rID"] as? String
            recipe.rName = jsonElement["rName"] as? String
            recipe.rPreptime = jsonElement["rPreptime"] as? String
            recipe.rCooktime = jsonElement["rCooktime"] as? String
            recipe.rServings = jsonElement["rServings"] as? String
            recipe.rDirections = jsonElement["rDirections"] as? String
            recipe.rLink = jsonElement["rLink"] as? String
            recipe.rCategory = jsonElement["rCategory"] as? String
            
            print(recipe.rID)
            
            recipes.add(recipe)
            
            
        }
        
        //dispatch_async(dispatch_get_main_queue(), {() -> Void in
        //  self.delegate.itemDownloaded(locations)
        //})
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.recipesDownloaded(items: recipes)
        })
        
        print(jsonResult)
        
    }
    
    
    
}
