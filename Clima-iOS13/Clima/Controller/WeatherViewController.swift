//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

import CoreLocation



protocol WeatherManagerDelegate {
    func didUpdateWeather(weather:WeatherModel)
}

class WeatherViewController: UIViewController {
    @IBOutlet weak var searchText: UITextField!

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    let locationManager = CLLocationManager()
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        searchText.delegate = self
        weatherManager.delegate = self
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
        locationManager.requestLocation()
        
    }
    
}


extension WeatherViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            //locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude:lat,longitude:lon)
        }
    }
    
    
    
}

//Mark: - UITextFieldDelegate

extension WeatherViewController:UITextFieldDelegate{
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchText.endEditing(true)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchText.endEditing(true)
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = textField.text{
            
            weatherManager.fetchWeather(cityname: city)
        }
        
        searchText.text=""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
            
        }else{
            textField.placeholder = "Type Something!"
            return false
        }
    }
    
    
}

//Mark: - WeatherManagerDelegate


extension WeatherViewController:WeatherManagerDelegate{
    
    func didUpdateWeather(weather:WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
        
    }
    
    
}
