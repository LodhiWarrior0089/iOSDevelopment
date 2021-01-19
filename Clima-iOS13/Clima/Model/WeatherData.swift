//
//  WeatherData.swift
//  Clima
//
//  Created by Azeem Lodhi on 26/12/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData:Decodable {
    
    var name:String
    var weather:[ Weather ]
    var main:Main
}

struct Main:Decodable {
    var temp:Double
}
struct Weather:Decodable {
    
    var id:Int
}
