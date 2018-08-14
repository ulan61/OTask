//
//  PostsEndPoint.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Alamofire

enum PostsEndPoint: ApiConfiguration {
    
    case getPosts
    case getWeather

    var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        case .getWeather:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getPosts:
            return nil
        case .getWeather:
            return [URLQueryItem(name: "id", value: "\(BISHKEK_ID),\(CHOLPON_ATA_ID),\(NARYN_ID),\(OSH_ID)"),
                    URLQueryItem(name: "appid", value: "e72ca729af228beabd5d20e3b7749713")]
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getWeather:
            return "/data/2.5/group"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getPosts:
            return nil
        case .getWeather:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string:"")!
        switch self {
        case .getPosts:
            urlComponents = URLComponents(string: BASE_URL + path)!
        case .getWeather:
            urlComponents = URLComponents(string: WEATHER_BASE_URL + path)!
        }
      
        urlComponents.queryItems = queryItems
        
        let url = try urlComponents.asURL()
        
        print(url)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
