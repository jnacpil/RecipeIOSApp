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
    var iID: String?
    var rID: String?
    var iName: String?
    var availAmount: String?
    var iUnit: String?
    var uName: String?
    var amount: String?
    
    //empty constructor
    override init()
    {
        
    }
    
    
    
    init(iID: String, rID: String, iName: String, availAmount: String, iUnit: String, uName: String, amount: String)
    {
        self.iID = iID
        self.rID = rID
        self.iName = iName
        self.availAmount = availAmount
        self.iUnit = iUnit
        self.uName = uName
        self.amount = amount
    }
    
    //print object's current state
    
    override var description: String {
        return "Id: \(iID), rID: \(rID), Name: \(iName), AvailableAmount: \(availAmount), Unit: \(uName), RecipeAmount: \(amount)"
    }
}
