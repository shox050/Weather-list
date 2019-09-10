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
    @IBOutlet private weak var temperature: UILabel!
    @IBOutlet private weak var weatherDescription: UILabel!
    
    func configure(byWeather weather: Weather) {
        
        
    }
}
