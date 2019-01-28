//
//  MovieGridDetailsViewController.swift
//  flixster
//
//  Created by Rodrigo Leyva on 1/27/19.
//  Copyright © 2019 Rodrigo Leyva. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieGridDetailsViewController: UIViewController {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var summaryView: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL = "https://image.tmdb.org/t/p/w185"
        let imagePath = movie["poster_path"] as! String
        let imageURL = URL(string: baseURL + imagePath)
        imageView.af_setImage(withURL: imageURL!)
        
        
        let posterPath = movie["backdrop_path"] as! String
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w780" + posterPath
        )
        posterView.af_setImage(withURL: posterURL!)
        
        
        titleView.text = movie["title"] as? String
        titleView.sizeToFit()
        summaryView.text = movie["overview"] as? String
        summaryView.sizeToFit()
        
        
        
        
        
        
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
