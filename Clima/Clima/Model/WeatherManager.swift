//
//  WeatherManager.swift
//  Clima
//
//  Created by Gizem Coşkun on 19.07.2023.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=92e4f469e0ba491bfcbd666b670fdb07&units=metric"
    
    func fetchWeather(cityName: String){
        let urlStringg = "\(weatherURL)&q=\(cityName)"
        print(urlStringg)
    }
    
}
