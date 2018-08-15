//
//  PostCommentsViewController.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class PostCommentsViewController: UIViewController {
    private var tableView: UITableView!
    var postId: Int!
    private lazy var viewModel = PostCommentListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getComments(postId: postId) { (success, message) in
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(PostCommentTableViewCell.self, forCellReuseIdentifier: String(describing: PostCommentTableViewCell.self))
        
        view.addSubview(tableView)
        tableView.fillSuperView()
    }
}

extension PostCommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostCommentTableViewCell.self), for: indexPath) as! PostCommentTableViewCell
        cell.configure(data: viewModel.comments[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
}

extension PostCommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
