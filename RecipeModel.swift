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
    var rID: Int?
    var rName: String?
    var rPreptime: Int?
    var rCooktime: Int?
    var rServings: Int?
    var rDirections: String?
    var rLink: String?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @id, @name, @addess, @latitude, @longitude, @type
    
    init(rID: Int, rName: String, rPreptime: Int, rCooktime: Int, rServings: Int, rDirections: String, rLink: String)
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