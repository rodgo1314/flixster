//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Rodrigo leyva on 1/25/19.
//  Copyright © 2019 Rodrigo Leyva. All rights reserved.
//

import UIKit
import Alamofire
class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let imagePath = movie["poster_path"] as! String
        let imageURL = URL(string: baseURL + imagePath)
        posterView.af_setImage(withURL: imageURL!)
        
        
        let posterPath = movie["backdrop_path"] as! String
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w780" + posterPath
        )
        backDropView.af_setImage(withURL: posterURL!)
        
        
        
        
        
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        summaryLabel.text = movie["overview"] as? String
        summaryLabel.sizeToFit()
        
        
        


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
