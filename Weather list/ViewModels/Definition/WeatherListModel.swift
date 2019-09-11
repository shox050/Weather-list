//
//  WeatherListModel.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherListModel {
    
    var selectedWeather: Weather? { get set }
    var weatherArray: [Weather] { get set }
    var didRequest: Bool { get set }
    
    func getWeatherInCity(byName name: String, _ completion: @escaping (Weather) -> Void)
    func getIcon(forWeather weather: Weather, _ completion: @escaping (Int) -> Void)
    func getCityName(forLocation location: CLLocation, _ completion: @escaping (String) -> Void)
}
