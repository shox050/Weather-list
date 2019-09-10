//
//  RequestParameters.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct RequestParameters: Encodable {
    var latitude: Double
    var longitude: Double
    var measurementType: String
    
    let apiKey: String = NetworkServiceConfiguration.apiKey
    
    
    init(latitude: Double, longitude: Double, measurementType: String = "metric") {
        self.latitude = latitude
        self.longitude = longitude
        self.measurementType = measurementType
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case measurementType = "units"
        case apiKey = "appid"
    }
}
