//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/22/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cellWeatherImage: UIImageView!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellWeatherType: UILabel!
    @IBOutlet weak var cellMaxTemp: UILabel!
    @IBOutlet weak var cellMinTemp: UILabel!
    
    
    @IBOutlet weak var cellBgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(forecast: Forecast){
        cellDate.text = forecast.date
        cellWeatherType.text = forecast.weatherType
        cellMaxTemp.text = forecast.highTemp
        cellMinTemp.text = forecast.lowTemp
        cellWeatherImage.image = UIImage(named: forecast.weatherType)
        cellBgImage.image = UIImage(named: "\(forecast.weatherType)-img")
        
    }
}
