//
//  ApiClient.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import ObjectMapper
import Alamofire

class ApiClient {
    static let shared = ApiClient()
    private func performRequest(route:ApiConfiguration, completion:@escaping (Result<Any?>)->Void) {
        Alamofire
            .request(route)
            .responseJSON{ (response) in
                
                guard let statusCode = response.response?.statusCode else {
                    completion(.failure(response.error!))
                    return
                }
                
                guard statusCode == 200 else{
                    completion(.failure(response.error!))
                    return
                }
                
                guard let data = response.result.value else {
                    completion(.success(nil))
                    return
                }
                completion(.success(data))
        }
    }
    
    func getPosts(completion:@escaping (_ success: Bool, _ message: String, _ posts: Array<Post>?)->Void)  {
        performRequest(route: PostsEndPoint.getPosts) { (result) in
            switch result{
            case .success(let data):
                let posts = Mapper<Post>().mapArray(JSONObject: data)
                completion(true, "", posts)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
            }
        }
    }
    
    func getWeather(completion:@escaping (_ success: Bool, _ message: String, _ weather: Array<Weather>?)->Void) {
        performRequest(route: PostsEndPoint.getWeather) { (result) in
            switch result {
            case .success(let data):
                let dictData = data as? Dictionary<String, Any>
                let listData = dictData!["list"]
                let weather = Mapper<Weather>().mapArray(JSONObject: listData)
                completion(true, "", weather)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
            }
        }
    }
    
    func getComments(postId: Int, completion:@escaping (_ success: Bool, _ message: String, _ comments: Array<Comment>?)->Void) {
        performRequest(route: PostsEndPoint.getComments(postId: postId)) { (result) in
            switch result {
            case .success(let data):
                let comments = Mapper<Comment>().mapArray(JSONObject: data)
                completion(true, "", comments)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
            }
        }
    }
    
    func getAlbums(completion:@escaping (_ success: Bool, _ message: String, _ albums: Array<Album>?) -> Void) {
        performRequest(route: AlbumsEndPoint.getAlbums) { (result) in
            switch result {
            case .success(let data):
                let albums = Mapper<Album>().mapArray(JSONObject: data)
                completion(true, "", albums)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
            }
        }
    }
    
    func getPhotos(albumId: Int, completion:@escaping (_ success: Bool, _ message: String, _ photos: Array<Photo>?)->Void) {
        performRequest(route: AlbumsEndPoint.getPhotos(albumId: albumId)) { (result) in
            switch result{
            case .success(let data):
                let photos = Mapper<Photo>().mapArray(JSONObject: data)
                completion(true, "", photos)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
            }
        }
    }
}
