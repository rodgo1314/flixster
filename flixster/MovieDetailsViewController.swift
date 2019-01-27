//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Rodrigo leyva on 1/25/19.
//  Copyright © 2019 Rodrigo Leyva. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath
        )
        posterView.af_setImage(withURL: posterURL!)
        
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath
        )
        backDropView.af_setImage(withURL: backdropURL!)
        
        
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
