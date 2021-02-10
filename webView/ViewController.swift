//
//  ViewController.swift
//  webView
//
//  Created by 神山駿 on 2021/02/10.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolbar.frame.size.height)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.youtube.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
}

