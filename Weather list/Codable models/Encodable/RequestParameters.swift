//
//  RequestParameters.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct RequestParameters: Encodable {
    var cityName: String
    var measurementType: String
    
    let apiKey: String = NetworkServiceConfiguration.apiKey
    
    
    init(cityName: String, measurementType: String = "metric") {
        self.cityName = cityName
        self.measurementType = measurementType
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case cityName = "q"
        case measurementType = "units"
        case apiKey = "appid"
    }
}
