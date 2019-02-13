//
//  PostTableViewCell.swift
//  RedditiOS24
//
//  Created by Cameron Milliken on 2/13/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upVotesLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var redditImageView: UIImageView!
    
    
    
    var post: CRMPost? {
        didSet {
           updateViews()
        }
    }
    
    func updateViews(){
        guard let post = post else {return}
        guard let imageString = post.thumbnailString else {return}
        CRMPostController.fetchImage(fromImageString: imageString) { (image) in
            DispatchQueue.main.async {
                self.redditImageView.image = image
        
            }
        }
        titleLabel.text = post.title
        upVotesLabel.text = "Up Votes: \(post.upVotes)"
        commentCountLabel.text = "Comment Count: \(post.commentCount)"
    }
}
