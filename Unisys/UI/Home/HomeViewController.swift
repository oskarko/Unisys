//  HomeViewController.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadData()
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let cellHeight: CGFloat = 160
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        configureUI()
        viewModel.fetchNews()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers
    
    private func setUpTableView() {
        tableView.register(UINib(nibName: HomeCell.identifier, bundle: nil),
                           forCellReuseIdentifier: HomeCell.identifier)
    }

    private func configureUI() {
        view.backgroundColor = .systemPurple

    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeCell.identifier,
                for: indexPath
            ) as? HomeCell
        else {
            assertionFailure("Could not deque cell")
            return UITableViewCell()
        }

        cell.configure(with: viewModel.getNews(at: indexPath))
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
