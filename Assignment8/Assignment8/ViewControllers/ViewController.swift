//
//  ViewController.swift
//  Assignment8
//
//  Created by Thong Hoang Nguyen on 2019-05-07.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let reuseIdentifier = "repo"
    var repos: [Repo] = [Repo]()
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.refreshControl = refreshController
        refreshController.addTarget(self, action: #selector(refreshRepos), for: .valueChanged)
        getRepositories(username: "hoangthongtv91")
    }
    
    @objc func refreshRepos() {
        getRepositories(username: "hoangthongtv91")
        
        
    }
    
    private func getRepositories(username: String) {
        guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else { return }
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: ", error)
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let repos = try decoder.decode([Repo].self, from: data)
                    self.repos = repos
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.refreshController.endRefreshing()
                    }
                } catch {
                    debugPrint("Error: ",error)
                }
            }
        }
        task.resume()
    }
    //MARK: - UITableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    //MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
            }
            return cell
        }()
        
        cell.textLabel?.text = repos[indexPath.row].name
        cell.detailTextLabel?.text = repos[indexPath.row].created_at.description
        return cell
    }
    
}

