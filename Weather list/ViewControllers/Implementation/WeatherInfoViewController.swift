//
//  WeatherInfoViewController.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class WeatherInfoViewController: UIViewController, WeatherInfoController {
    
    private var weatherInfoViewModel: WeatherInfoViewModel!
    
    @IBOutlet private weak var ivLogo: UIImageView!
    @IBOutlet private weak var lTemperature: UILabel!
    @IBOutlet private weak var lCityName: UILabel!
    @IBOutlet private weak var lStatus: UILabel!
    @IBOutlet private weak var lCoordinate: UILabel!
    @IBOutlet private weak var lDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
}

extension WeatherInfoViewController {
    func configure(withConfiguration configuration: WeatherConfiguration) {
        weatherInfoViewModel = WeatherInfoViewModel(weather: configuration.weather)
        
        setUp()
    }
    
    private func setUp() {
        guard weatherInfoViewModel != nil else {
            print("Error: weatherInfoViewModel == nil")
            return
        }
        
        ivLogo?.image = weatherInfoViewModel.icon
        lTemperature?.text = weatherInfoViewModel.temperature
        lCityName?.text = weatherInfoViewModel.cityName
        lStatus?.text = weatherInfoViewModel.status
        lCoordinate?.text = weatherInfoViewModel.coordinate
        lDescription?.text = weatherInfoViewModel.description
    }
}
