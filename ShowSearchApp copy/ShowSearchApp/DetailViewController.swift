//
//  DetailViewController.swift
//  ShowSearchApp
//
//  Created by student on 11/10/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var imgLbl: UIImageView!
    
    
    var show: Show!
    @IBOutlet weak var descriptionlbl: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard show != nil else{
            print("show is nil")
            return
        }
        
        updateUI()
    }
    func updateUI(){
        showName.text = show.name
        languageLbl.text = show.language ?? " "
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression,range: nil)
        descriptionlbl.text = show.summary ?? ""
        networkLabel.text = show.network?.name ?? ""
        if let rating = show.rating?.average{
            ratingLabel.text = "\(rating)"
        }else{
            ratingLabel.text = "-"
        }
        var genreList = ""
        if show.genres != nil{
            for genre in show.genres!
            {
                genreList = genreList + "\(genre) "
            }
//            if genreList != nil{
//                genreList.removeLast()
//            }
        }
        genreLbl.text = genreList
        guard let url = URL(string: show.image?.original ?? "")else{
            return
        }
        do {let data = try Data(contentsOf : url)
            imgLbl.image = UIImage(data: data)
        }
        catch{
            print("unable to fetch image")
        }
            
    }
    



}
