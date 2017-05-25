//
//  File.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/21/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import UIKit
import Alamofire

class ForecastVC{
    
    var forecast = [Forecast]()
    
    func downloadForecastData(completed: @escaping DownloadComplete){
        //download forecast data
        let forecastURL = URL(string: FORECAST_WEATHER_URL)!
        //print(forecastURL)
        Alamofire.request(forecastURL).responseJSON{ response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                if let list = dict["list"] as? [Dictionary<String,Any>] {
                    for obj in list{
                        let object: Dictionary<String,Any> = obj
                        let dt: TimeInterval! = object["dt"] as! TimeInterval //get the date timestamp
                        
                        //**Convert timestamp to day of week
                        let unixConvertedDate = Date(timeIntervalSince1970: dt)
                        let weekday = Calendar.current.component(.weekday, from: unixConvertedDate)
                        let f = DateFormatter()
                        f.dateFormat = "MMM dd"
                        let dayofweek = "\(f.shortWeekdaySymbols[weekday-1]),\(f.string(from: unixConvertedDate))"
                        
                        //print(dayofweek)
                        //***********************************
                        
                        let temp: Dictionary<String,Any> = object["temp"]  as! Dictionary<String, Any> //get the temperatures
                        //let minTemp = "\(self.convertKtoF(tempKelvin: temp["min"] as! Double))"
                        //let maxTemp = "\(self.convertKtoF(tempKelvin: temp["max"] as! Double))"
                        let minTemp = "\(Int(round(temp["min"] as! Double)))°F"
                        let maxTemp = "\(Int(round(temp["max"] as! Double)))°F"
                        
                        //print("\(minTemp) \(maxTemp)")
                        
                        let weather: [Dictionary<String,Any>] = obj["weather"] as! [Dictionary<String, Any>]
                        let weatherType = weather[0]["main"]
                        
                        //print(weatherType!)
                        
                        let forecastElement = Forecast(date: dayofweek, weatherType: weatherType as! String, highTemp: maxTemp, lowTemp: minTemp)
                        
                        self.forecast.append(forecastElement)
                        
                    }
                }
            }
            self.forecast.remove(at: 0)
            //self.forecast.remove(at: 0)
            completed()
        }
    }
    
    /*func convertKtoF (tempKelvin: Double) -> Double{
        let kelvinToFarenheitPreDiv = (tempKelvin * (9/5) - 459.67)
        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv/10))
        let temFarenheit = kelvinToFarenheit
        //print(self._currentTemp)
        return temFarenheit
    }*/
}
