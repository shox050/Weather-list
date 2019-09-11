//
//  Weather.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import MapKit

struct Weather {
    let cityName: String
    let cityId: Int
    let temperature: Int
    let coordinate: CLLocationCoordinate2D
    let status: String
    let description: String
    let iconId: String
    var icon: UIImage?
}
