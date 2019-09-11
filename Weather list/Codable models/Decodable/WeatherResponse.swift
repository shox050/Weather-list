//
//  WeatherResponse.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let coordinate: Coordinate
    let weatherInformation: [WeatherInformation]
    let cityId: Int
    let cityName: String
    let cod: Int
    let temperature: Temperature
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherInformation = "weather"
        case cityId = "id"
        case cityName = "name"
        case cod
        case temperature = "main"
    }
    
    struct Coordinate: Decodable {
        let longitude: Double
        let latitude: Double
        
        private enum CodingKeys: String, CodingKey {
            case longitude = "lon"
            case latitude = "lat"
        }
    }
    
    struct WeatherInformation: Decodable {
        let id: Int
        let status: String
        let description: String
        let iconId: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case status = "main"
            case description
            case iconId = "icon"
        }
    }
    
    struct Temperature: Decodable {
        let temperature: Float
        
        private enum CodingKeys: String, CodingKey {
            case temperature = "temp"
        }
    }
}
