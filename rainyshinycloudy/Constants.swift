//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/20/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let ACCURACY = "&type=accurate"
let APP_ID = "&appid="
let API_KEY = "45e3a0a000090189c644d2cbfd28a0b5"
let FORECAST_CNT = "&cnt=10"
let UNITS = "&units=imperial" //for Fahrenheit

typealias DownloadComplete = () -> ()

//Location.sharedInstance.latitude = 37.785834
//Location.sharedInstance.longitude = -122.406417

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(ACCURACY)\(APP_ID)\(API_KEY)"

let FORECAST_WEATHER_URL = "\(FORECAST_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(FORECAST_CNT)\(ACCURACY)\(UNITS)\(APP_ID)\(API_KEY)"

//let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)37.785834\(LONGITUDE)-122.406417\(APP_ID)\(API_KEY)"

//let FORECAST_WEATHER_URL = "\(FORECAST_URL)\(LATITUDE)37.785834\(LONGITUDE)-122.406417\(FORECAST_CNT)\(APP_ID)\(API_KEY)"
