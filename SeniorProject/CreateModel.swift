//
//  CreateModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 3/6/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

//
//  HomeModel.swift
//  DatabaseTestApp
//
//  Created by James McConville on 11/16/16.
//  Copyright © 2016 James McConville. All rights reserved.
//


import Foundation

/*protocol CreateModelProtocol: class {
    func createRecipe(createdRecipe: RecipeModel, inputURL: String)
}*/


class CreateModel: NSObject, URLSessionDataDelegate {
    
    //properties
    weak var delegate: CreateModel!
    var data : NSMutableData = NSMutableData()
    
    // function to call to save report
    func createRecipe(createdRecipe: RecipeModel, inputURL: String) {
        //created NSURL
        let requestURL = NSURL(string: inputURL)
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        
        let name = createdRecipe.rName
        let preptime = createdRecipe.rPreptime
        let cooktime = createdRecipe.rCooktime
        let servings = createdRecipe.rServings
        let directions = createdRecipe.rDirections
        let category = Int(createdRecipe.rCategory!)
        
        
        //print("Blob: \(blob)")
        
        //creating the post parameter by concatenating the keys and values from text field
        
        let postParameters = "rName=\(name)&rPreptime=\(preptime)&rCooktime=\(cooktime)&rServings=\(servings)&rDirections=\(directions)&rCategory=\(category)"
        
        
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil{
                print("error is \(error)")
                return;
            }
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                //parsing the json
                if let parseJSON = myJSON {
                    //creating a string
                    var msg : String
                    
                }
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
    }
    
}
