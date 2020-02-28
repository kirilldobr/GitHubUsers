//
//  UserDetailViewController.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import UIKit
import WebKit

class UserDetailViewController: ViewController<UserDetailViewModel> {
    lazy var webView = WKWebView()
    
    let spinner = UIActivityIndicatorView()
    
    override func loadView() {
        super.loadView()
        // better than adding as subview
        // doesn't lag on opening
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        webView.navigationDelegate = self
        
        view.addSubview(spinner, layout: Center())
        
        spinner.hidesWhenStopped = true
        
        shouldHaveErrorLabel = true
        spinner.style = .medium
        spinner.color = .black
    }
    
    override func setModel(_ viewModel: UserDetailViewModel) {
        super.setModel(viewModel)
        
        title = viewModel.username
        
        guard let pageURL = URL(string: viewModel.pageURL) else { return }
        spinner.startAnimating()
        webView.load(URLRequest(url: pageURL))
    }
}

extension UserDetailViewController: WKNavigationDelegate {
    func webView(_: WKWebView, didFinish _: WKNavigation!) {
        hideError()
        spinner.stopAnimating()
    }
    
    func webView(_: WKWebView, didFail _: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
        showError(message: "Failed to load page with error:\n\(error)")
    }
    
//    func webView(_: WKWebView, didFail _: WKNavigation!, withError error: Error) {
//
//    }
}
