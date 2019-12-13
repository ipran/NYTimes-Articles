//
//  DetailViewController.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 13/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndiacator: UIActivityIndicatorView!
    
    var data: Result?
    
    // MARK: - View LifeCycle
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
    // Load WKWebView
    func loadWebView() {
        let url = URL(string: data!.url)!
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

// MARK: - WKNavigationDelegate
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndiacator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopAnimatingActivityIndicator()
        
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        stopAnimatingActivityIndicator()
        
    }
    func stopAnimatingActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndiacator.stopAnimating()
            self.activityIndiacator.isHidden = true
        }
        
    }
    
}
