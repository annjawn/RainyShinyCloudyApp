//
//  WeatherAlamo.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/21/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import UIKit
import Alamofire

class WeatherAlamo{
    func downloadWeatherDetails (completed: DownloadComplete){
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON{
            response in
            let result = response.result
            print(result)
            print(response)
        }
        completed()
    }
}
