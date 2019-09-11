//
//  WeatherInfoModel.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

protocol WeatherInfoModel {
    var cityName: String { get }
    var status: String { get }
    var description: String { get }
    var temperature: String { get }
    var icon: UIImage? { get }
    var coordinate: String { get }
    
    init(weather: Weather)
}
