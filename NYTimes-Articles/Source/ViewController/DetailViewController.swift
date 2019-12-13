//
//  DetailViewController.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 13/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var data: Result?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        webView.navigationDelegate = self
        loadWebView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        webView.load(URLRequest(url: URL(string:"about:blank")!))
        
    }
    func loadWebView() {
        let url = URL(string: data!.url)!
        print("URL ***** \(url)")
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}

// MARK: - Event Handler
extension DetailViewController {
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
