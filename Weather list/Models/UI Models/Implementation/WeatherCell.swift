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

}

// MARK: - WeatherCellConfigurable
extension WeatherCell: WeatherCellConfigurable {
    func configure(byWeather weather: Weather) {
        ivLogo.image = weather.icon
        lCityName.text = weather.cityName
        lTemperature.text = "\(weather.temperature)°C"
        lDescription.text = weather.description
    }
}
