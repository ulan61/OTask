//
//  PhotosListViewModel.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class PhotosListViewModel {
    lazy var photos = [Photo]()
    
    func getPhotos(albumId: Int,completion: @escaping (_ success: Bool, _ message: String)->())  {
        ApiClient.shared.getPhotos(albumId: albumId) { [weak self] (success, message, photos) in
            guard let strongSelf = self else {
                return
            }
            guard success else {
                completion(success, message)
                return
            }
            strongSelf.photos = photos!
            completion(success, message)
        }
    }
}
