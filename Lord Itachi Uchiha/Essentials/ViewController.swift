//
//  ViewController.swift
//  Lord Itachi Uchiha
//
//  Created by Chiranjeev Mishra on 23/07/21.
//

import UIKit
import WebKit
import SideMenu
class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    var menu: SideMenuNavigationController?
    
    //Script Work
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
       
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
        // Menu option
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
//Required Buttons
    
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
    @IBAction func menuButton(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    //Functions for WebView
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
           
       ActInd.startAnimating()
           
   }
   
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
       ActInd.stopAnimating()
       
   }
   
   func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       
       ActInd.stopAnimating()
       
   }

    
   //Function for Search Menu (you can type url in here)
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       searchBar.resignFirstResponder()
       let url  = URL(string: "http://\(searchBar.text!)")
       let request = URLRequest(url: url!)
       webView.load(request)
   }
    
    
}

class MenuListController: UITableViewController {
    var items = ["Inspect","Snapshot","Properties"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //do something
    }
}
