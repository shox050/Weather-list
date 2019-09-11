//
//  NetworkRequestable.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol NetworkRequestable {
    func getWeatherInCity(byName name: String, _ completion: @escaping (Result<WeatherResponse, Error>) -> Void)
    
    func getIcon(byId id: String, _ completion: @escaping (Result<Data, Error>) -> Void)
}
