//
//  AlbumsEndPoint.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Alamofire

enum AlbumsEndPoint: ApiConfiguration {
    case getAlbums
    case getPhotos(albumId: Int)
    
    var method: HTTPMethod{
        switch self {
        case .getAlbums:
            return .get
        case .getPhotos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAlbums:
            return "/albums"
        case .getPhotos:
            return "/photos"
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var queryItems: [URLQueryItem]?{
        switch self {
        case .getAlbums:
            return nil
        case .getPhotos(let albumId):
            return [URLQueryItem(name: "albumId", value: "\(albumId)")]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: BASE_URL + path)!
        
        urlComponents.queryItems = queryItems
        
        let url = try urlComponents.asURL()
        
        print(url)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
                
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
