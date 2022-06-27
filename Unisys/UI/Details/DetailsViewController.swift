//  DetailsViewController.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: DetailsViewModel!
    
    @IBOutlet weak var titleLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descriptionLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers

    private func configureUI() {
        title = viewModel.getSourceName()
        titleLabel.text = viewModel.getTitle()
        titleLabelHeight.constant = titleLabel.requiredHeight
        descriptionLabel.text = viewModel.getDescription()
        descriptionLabelHeight.constant = descriptionLabel.requiredHeight
        dateLabel.text = viewModel.getDateString()
        
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = 8
        newsImageView.downloadImage(url: viewModel.getURLToImageString())
    }
    
}

// MARK: - DetailsViewControllerProtocol

protocol DetailsViewControllerProtocol: AnyObject { }
extension DetailsViewController: DetailsViewControllerProtocol { }
