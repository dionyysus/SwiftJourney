//
//  WeatherManager.swift
//  Clima
//
//  Created by Gizem Coşkun on 19.07.2023.
//

import Foundation

//Step 1
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=92e4f469e0ba491bfcbd666b670fdb07&units=metric"
    
    //STEP 2
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    //STEP 3
                    if let weather = self.parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
            
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather?[0].id
            let temp = decodeData.main?.temp ?? 00
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id ?? 0, cityName: name ?? "", temperature: temp )
            return weather
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
}
