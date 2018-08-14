//
//  ApiConfiguration.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Alamofire



let BASE_URL = "http://jsonplaceholder.typicode.com"
let WEATHER_BASE_URL = "http://api.openweathermap.org"
protocol ApiConfiguration: URLRequestConvertible{
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
