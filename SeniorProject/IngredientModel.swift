//
//  IngredientModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/9/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation

class IngredientModel: NSObject {
    
    //properties
    var iID: Int?
    var iName: String?
    var availAmount: Int?
    var iUnit: Int?
    var uName: String?
    
    //empty constructor
    override init()
    {
        
    }
    
    
    
    init(iID: Int, iName: String, availAmount: Int, iUnit: Int, uName: String)
    {
        self.iID = iID
        self.iName = iName
        self.availAmount = availAmount
        self.iUnit = iUnit
        self.uName = uName
    }
    
    //print object's current state
    
    override var description: String {
        return "Id: \(iID), Name: \(iName), AvailableAmount: \(availAmount), Unit: \(uName)"
    }
}
