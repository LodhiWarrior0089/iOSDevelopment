//
//  WeatherManager.swift
//  Clima
//
//  Created by Azeem Lodhi on 25/12/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
struct WeatherManager{
    var delegate :WeatherManagerDelegate?
    
    
    var weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=52d0ed85bec49d34aa4fc0669c866ce3&units=metric&q="
    
    var newUrl = "https://api.openweathermap.org/data/2.5/weather?appid=52d0ed85bec49d34aa4fc0669c866ce3&units=metric&"
    
    func fetchWeather(latitude:CLLocationDegrees , longitude:CLLocationDegrees ){
        
        
        let fullUrl = newUrl + "lat="+String(latitude)+"&lon="+String(longitude)
        performRequest(urlString: fullUrl)
        print(fullUrl)
        
        
    }
    func fetchWeather(cityname: String){
        
        let fullUrl = weatherUrl + cityname
        performRequest(urlString: fullUrl)
        
    }
    func performRequest(urlString:String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task=session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    
                    print(error!)
                    return
                }
                if let safeData=data {
                    
                    if let weather = self.parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(weather: weather)
                    
                    }
                    
                }
            }
            task.resume()
            
        }
        
        
    }
    func parseJSON(weatherData:Data)->WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData=try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
            
            
        } catch{
            print("error")
            return nil
        }
        
        
        
    }
    
    
}



