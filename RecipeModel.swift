//
//  RecipeModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/2/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation
class RecipeModel: NSObject {
    
    //properties
    var rID: String?
    var rName: String?
    var rPreptime: String?
    var rCooktime: String?
    var rServings: String?
    var rDirections: String?
    var rLink: String?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @id, @name, @addess, @latitude, @longitude, @type
    
    init(rID: String, rName: String, rPreptime: String, rCooktime: String, rServings: String, rDirections: String, rLink: String)
    {
        self.rID = rID
        self.rName = rName
        self.rPreptime = rPreptime
        self.rCooktime = rCooktime
        self.rServings = rServings
        self.rDirections = rDirections
        self.rLink = rLink
    }
    
    //print object's current state
    
    override var description: String {
        return "Id: \(rID), Name: \(rName), Preptime: \(rPreptime), Cooktime: \(rCooktime), Servings: \(rServings), Directions: \(rDirections), Link: \(rLink)"
    }
}
