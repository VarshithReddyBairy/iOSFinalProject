//
//  SearchViewController.swift
//  ShowSearchApp
//
//  Created by student on 12/5/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchField.text!
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let destination = segue.destination as! ViewController
        destination.searchText = searchText
    }

    

}
