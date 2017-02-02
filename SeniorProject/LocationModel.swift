//
//  LocationModel.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 1/26/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation

class LocationModel: NSObject {
    
    //properties
    var mID: Int?
    var mName: String?
    var mAddress: String?
    var mLatitude: String?
    var mLongitude: String?
    var mType: Int?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @id, @name, @addess, @latitude, @longitude, @type
    
    init(mID: Int, mName: String, mAddress: String, mLatitude: String, mLongitude: String, mType: Int)
    {
        self.mID = mID
        self.mName = mName
        self.mAddress = mAddress
        self.mLatitude = mLatitude
        self.mLongitude = mLongitude
        self.mType = mType
        
    }
    
    //print object's current state
    
    override var description: String {
        return "Id: \(mID), Name: \(mName), Address: \(mAddress), Latitude: \(mLatitude), Longitude: \(mLongitude), Type: \(mType)"
    }
}
