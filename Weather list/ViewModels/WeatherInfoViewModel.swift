//
//  WeatherInfoViewModel.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class WeatherInfoViewModel {
    private let weather: Weather
    
    var cityName: String { return weather.cityName }
    var status: String { return weather.status }
    var description: String { return weather.description }
    var temperature: String { return "\(weather.temperature)°C" }
    var icon: UIImage? {
        if let icon = weather.icon {
            return icon
        }
        return nil
    }
    var coordinate: String {
        return "latitude: \(weather.coordinate.latitude) longitude: \(weather.coordinate.longitude)"
    }
    
    init(weather: Weather) {
        self.weather = weather
    }
}
