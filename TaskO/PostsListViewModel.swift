//
//  PostsListViewModel.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class PostsListViewModel {
    lazy var items = [PostViewModelItem]()
    private lazy var allPosts = [Post]()
    private lazy var randomPosts = [Post]()
    private lazy var weatherData = [Weather]()
    
    func getAllData(completion: @escaping(_ success: Bool)->Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getRandomizedPosts { (success) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getWeather { (success) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main){
            for randomPost in self.randomPosts {
                let postViewModelItem = PostViewModelItem(data: randomPost)
                self.items.append(postViewModelItem)
            }
            for weather in self.weatherData {
                let postViewModelItem = PostViewModelItem(data: weather)
                self.items.append(postViewModelItem)
            }
            self.items.shuffle()
            
            completion(true)
        }
    }
    
    private func getRandomizedPosts(completion: @escaping (_ success: Bool) -> Void) {
        ApiClient.shared.getPosts { [weak self] (success, message, posts) in
            guard let strongSelf = self else {
                return
            }
            guard success else{
                return
            }
            
            strongSelf.allPosts = posts!
            strongSelf.randomizePosts()
            completion(success)
        }
    }
    
    private func getWeather(completion: @escaping (_ success: Bool) -> Void)  {
        
        ApiClient.shared.getWeather { [weak self] (success, message, weather) in
            guard let strongSelf = self else {
                return
            }
            guard success else{
                return
            }
            strongSelf.weatherData = weather!
            completion(success)
        }
        
    }
    
    private func randomizePosts() {
        allPosts.shuffle()
        for i in 0..<10 {
            randomPosts.append(allPosts[i])
        }
    }
}
