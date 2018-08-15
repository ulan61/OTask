//
//  PostsViewController.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/14/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit
import SafariServices

class PostsViewController: UIViewController {
    private var tableView: UITableView!
    private lazy var viewModel = PostsListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getAllData(){_ in
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: String(describing: WeatherTableViewCell.self))
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        
        view.addSubview(tableView)
        tableView.fillSuperView()
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        switch item.dataType {
        case .weather:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath) as! WeatherTableViewCell
            cell.configure(data: item.data as! Weather)
            return cell
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            cell.configure(data: item.data as! Post)
            return cell
        }
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        switch item.dataType {
        case .weather:
            present(SFSafariViewController(url: URL(string: "https://o.kg/ru/chastnym-klientam/")!), animated: true, completion: nil)
        case .post:
            let postCommentsViewController = PostCommentsViewController()
            postCommentsViewController.postId = (item.data as! Post).id
            navigationController?.pushViewController(postCommentsViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
