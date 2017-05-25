//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/22/17.
//  Copyright © 2017 anjan. All rights reserved.
//  Singleton Class

import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init(){}
    var latitude: Double!
    var longitude: Double!
    
}
