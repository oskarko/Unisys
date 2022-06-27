//
//  HomeCell.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        newsImageView.image = nil
        newsTitleLabel.text = ""
        newsDescriptionLabel.text = ""
    }
    
    // MARK: - Helpers
    
    func configure(with article: Article?) {
        guard let article = article else { return }
        
        newsTitleLabel.text = article.title
        newsDescriptionLabel.text = article.description
        newsImageView.downloadImage(url: article.urlToImage)
    }
    
}
