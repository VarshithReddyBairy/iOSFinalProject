//
//  ViewController.swift
//  ShowSearchApp
//
//  Created by student on 11/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var shows = Shows()
    var searchText = ""
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        shows.urlString += searchText
        shows.getData {
            DispatchQueue.main.async {
                self.sortTable()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.showsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shows.showsArray[indexPath.row].show.name
        if let rating = shows.showsArray[indexPath.row].show.rating?.average{
            cell.detailTextLabel?.text = "\(rating)"
        }
        else{
        cell.detailTextLabel?.text = "-"
        }
        return cell
    }
    
    func sortTable(){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            shows.showsArray.sort(by: {$0.show.name < $1.show.name})
        case 1:
            shows.showsArray.sort(by: {$0.show.rating?.average ?? 0.0 > $1.show.rating?.average ?? 0.0})
        default:
            print("Error")
        
        }
        tableView.reloadData()
    }
    @IBAction func segmentPressed(_ sender: Any) {
        sortTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.show = shows.showsArray[tableView.indexPathForSelectedRow!.row].show
        
    }
}

