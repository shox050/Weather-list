//
//  Weather.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let coordinate: Coordinate
    let weatherInformation: [WeatherInformation]
    let cityId: Int
    let cityName: String
    let cod: Int
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherInformation = "weather"
        case cityId = "id"
        case cityName = "name"
        case cod
    }
    
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
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case status = "main"
        case description
        case icon
    }
}


//struct WeatherWrapper: Decodable {
//    let cod: Int
//    let calculateTime: Float
//    let count: Int
//    let weatherInformation: [WeatherInformation]
//
//    private enum CodingKeys: String, CodingKey {
//        case cod
//        case calculateTime = "calctime"
//        case count = "cnt"
//        case weatherInformation = "list"
//    }
//}
//
//struct WeatherInformation: Decodable {
//    let cityId: Int
//    let name: String
//    let weatherParameters: WeatherParameters
//    let coordinate: Coordinate
//    let weather: [Weather]
//
//    private enum CodingKeys: String, CodingKey {
//        case cityId = "id"
//        case name
//        case weatherParameters = "main"
//        case coordinate = "coord"
//        case weather
//    }
//}
//
//struct Coordinate: Decodable {
//    let longitude: Double
//    let latitude: Double
//
//    private enum CodingKeys: String, CodingKey {
//        case longitude = "Lon"
//        case latitude = "Lat"
//    }
//}
//
//struct Weather: Decodable {
//    let weatherConditionId: Int
//    let weatherIcon: String
//    let description: String
//
//    private enum CodingKeys: String, CodingKey {
//        case weatherConditionId = "id"
//        case weatherIcon = "icon"
//        case description
//    }
//}
//
//struct WeatherParameters: Decodable {
//    let temperature: Float
//
//    private enum CodingKeys: String, CodingKey {
//        case temperature = "temp"
//    }
//}
