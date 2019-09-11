//
//  WeatherResponseConverter.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import MapKit

class WeatherResponseConvertert: WeatherResponseConvertable {
    
    func convert(_ weatherResponse: WeatherResponse) -> Weather {
        
        let cityName = weatherResponse.cityName
        let cityId = weatherResponse.cityId
        let temperature = Int(weatherResponse.temperature.temperature)
        let coordinate = CLLocationCoordinate2D(latitude: weatherResponse.coordinate.latitude,
                                                longitude: weatherResponse.coordinate.longitude)
        let status = weatherResponse.weatherInformation.first?.status ?? ""
        let description = weatherResponse.weatherInformation.first?.description ?? ""
        let iconId = weatherResponse.weatherInformation.first?.iconId ?? ""
        
        return Weather(cityName: cityName, cityId: cityId, temperature: temperature, coordinate: coordinate, status: status, description: description, iconId: iconId, icon: nil)
    }
}
