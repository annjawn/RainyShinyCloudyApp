//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Anjan on 5/20/17.
//  Copyright © 2017 anjan. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather = CurrentWeather()
    var forecast = ForecastVC()
    var forecastsArray = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //print(Location.sharedInstance.latitude,Location.sharedInstance.longitude)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{

            locationManager.requestLocation() //implements didUpdateLocations delegate see below
            
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus() //recursive
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation //an array of CLLocations
        
        //currentLocation = locationManager.location
        Location.sharedInstance.latitude = userLocation.coordinate.latitude
        Location.sharedInstance.longitude = userLocation.coordinate.longitude
        
        //update UI with new data
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails{
            //update ui
            self.forecast = ForecastVC()
            self.forecast.downloadForecastData{
                //Update UI
                self.forecastsArray = self.forecast.forecast
                self.tableView.reloadData()
                self.updateMainUI()
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //If requestLocation() fails then default to San Francisco Coordinates
        Location.sharedInstance.latitude = 37.785834
        Location.sharedInstance.longitude = -122.406417
        
        //Update UI with default data
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails{
            //update ui
            self.forecast = ForecastVC()
            self.forecast.downloadForecastData{
                //Update UI
                self.forecastsArray = self.forecast.forecast
                self.tableView.reloadData()
                self.updateMainUI()
            }
        }
    }
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            let forecastRow = forecastsArray[indexPath.row]
            cell.updateUI(forecast: forecastRow)
            return cell
        }else{
            return UITableViewCell()
        }
    }

    func updateMainUI(){
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)°"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
}

