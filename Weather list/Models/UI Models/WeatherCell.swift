//
//  WeatherCell.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet private weak var ivLogo: UIImageView!
    @IBOutlet private weak var lCityName: UILabel!
    @IBOutlet private weak var lTemperature: UILabel!
    @IBOutlet private weak var lDescription: UILabel!
    
    func configure(byWeather weather: Weather) {
        
        ivLogo.image = weather.icon
        lCityName.text = weather.cityName
        lTemperature.text = String(weather.temperature)
        lDescription.text = weather.description
    }
}
