//
//  WeatherCellConfigurable.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol WeatherCellConfigurable {
    func configure(byWeather weather: Weather)
}
