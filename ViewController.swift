//
//  ViewController.swift
//  Hitsukaya PWA
//
//  Created by Hitsukaya Valentaizar on 23.10.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
                                configuration: configuration)
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: "https://mafautoful.hs4m.com/") else {
            return
        }
        webView.load(URLRequest(url: url))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}

