//
//  ViewController.swift
//  AutoSearchBar
//
//  Created by andrew on 11/26/2018.
//  Copyright (c) 2018 andrew. All rights reserved.
//

import UIKit
import AutoSearchBar

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBar.delegate = self
        searchBar.setAutoSearch(enable: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.cancelAutoSearch()
        print("search text: \(Date().timeIntervalSince1970)")
        searchResultLabel.text = self.searchBar.text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("lastest text: \(Date().timeIntervalSince1970)")
    }
}

