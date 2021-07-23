//
//  ViewController.swift
//  Lord Itachi Uchiha
//
//  Created by Chiranjeev Mishra on 21/07/21.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
       
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
    }

    @IBAction func backButton(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func refreshButton(_ sender: Any) {
        webView.reload()
    }
    @IBAction func stopButton(_ sender: Any) {
        webView.stopLoading()
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
           
       ActInd.startAnimating()
           
   }
   
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
       ActInd.stopAnimating()
       
   }
   
   func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       
       ActInd.stopAnimating()
       
   }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       searchBar.resignFirstResponder()
       let url  = URL(string: "http://\(searchBar.text!)")
       let request = URLRequest(url: url!)
       webView.load(request)
   }
}
