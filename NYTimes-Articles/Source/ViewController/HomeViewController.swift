//
//  HomeViewController.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResponseLabel: UILabel!
    
    var apiManager = NYTimesAPIManager()
    var data: [Result]?
    
    lazy var detailViewController: DetailViewController = {
        return UIStoryboard.main().instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configureTableView()
        
    }
    func loadData() {
        // Load activity indicator
        activityIndicator.startAnimating()
        // Fetch data from server
        apiManager.fetchData { (response) in
            switch(response) {
                
            case let .failure(error):
                self.noResponseLabel.text = error.localizedDescription
                self.stopAnimatingActivityIndicator()
                break
                
            case let .success(result):
                self.data = result.results
                self.stopAnimatingActivityIndicator()
                self.refreshTableView()
                
            }
            
        }
        
    }
    func configureTableView() {
        tableView.tableFooterView = UIView()
        
    }
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
    }
    func stopAnimatingActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
    }
    
}

// MARK: - TableView Related
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        guard let cellData = data?[indexPath.row] else {
            return cell
            
        }
        cell.data = cellData
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(NYTimesConstants.homeTableViewCellHeight)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = data?[indexPath.row]
        detailViewController.data = cellData
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
}
