//
//  PostListTableViewController.swift
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [CRMPost] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }
    
    func fetchAndDisplayNewPostsFor(subreddit: String) {
        CRMPostController.fetchAllPosts(forSubreddit: subreddit) { (posts) in
            guard let posts = posts else {return}
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
 }

extension PostListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        fetchAndDisplayNewPostsFor(subreddit: searchTerm.lowercased())
    }
}
