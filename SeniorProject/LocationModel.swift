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
    var id: Int?
    var name: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var type: Int?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @id, @name, @addess, @latitude, @longitude, @type
    
    init(id: Int, name: String, address: String, latitude: String, longitude: String, type: Int)
    {
        self.id = id
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.type = type
        
    }
    
    //print object's current state
    
    override var description: String {
        return "Id: \(id), Name: \(name), Address: \(address), Latitude: \(latitude), Longitude: \(longitude), Type: \(type)"
    }
}
