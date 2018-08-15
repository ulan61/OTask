//
//  AlbumsListViewModel.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class AlbumsListViewModel {
    private lazy var allAlbums = [Album]()
    lazy var randomAlbums = [Album]()
    func getAlbums(completion: @escaping (_ success: Bool, _ message: String)->Void) {
        ApiClient.shared.getAlbums { [weak self] (success, message, albums) in
            guard let strongSelf = self else {
                return
            }
            guard success else {
                completion(success, message)
                return
            }
            strongSelf.allAlbums = albums!
            strongSelf.randomizeAlbums()
            completion(success, message)
        }
    }
    
    private func randomizeAlbums() {
        allAlbums.shuffle()
        for i in 0..<10 {
            randomAlbums.append(allAlbums[i])
        }
    }
}
