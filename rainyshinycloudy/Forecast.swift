//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/21/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        
        return _lowTemp
    }
    
    init(date: String, weatherType: String, highTemp: String, lowTemp: String){
        _date = date
        _weatherType = weatherType
        _highTemp = highTemp
        _lowTemp = lowTemp
    }
    
}
