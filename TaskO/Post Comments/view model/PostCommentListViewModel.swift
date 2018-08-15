//
//  PostCommentListViewModel.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import Foundation

class PostCommentListViewModel {
    lazy var comments = [Comment]()
    
    func getComments(postId: Int, completion: @escaping (_ success: Bool, _ message: String)->())  {
        ApiClient.shared.getComments(postId: postId) {[weak self] (success, message, comments) in
            guard let strongSelf = self else {
                return
            }
            guard success else {
                completion(success, message)
                return
            }
            strongSelf.comments = comments!
            completion(success, message)
        }
    }
}
