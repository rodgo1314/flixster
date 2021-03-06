//
//  MainFlixViewController.swift
//  flixster
//
//  Created by Rodrigo Leyva on 1/16/19.
//  Copyright © 2019 Rodrigo Leyva. All rights reserved.
//

import UIKit
import AlamofireImage


class MainFlixViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var movies = [[String:Any]]()

    @IBOutlet weak var tableView: UITableView!
    
    let myRefreshControl = UIRefreshControl()
    var page: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.dataSource = self
        tableView.delegate = self
        loadMovies()
        
        myRefreshControl.addTarget(self, action: #selector(loadMoreMovies), for: .valueChanged)
        
        tableView.refreshControl = myRefreshControl
        
        
        
        
    }
    
    @objc func loadMovies(){
        page = 1
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=\(page ?? 1)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
    }
    
    @objc func loadMoreMovies(){
        page = page + 1
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=\(page ?? 1)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let x = "123"
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell") as! MovieViewCell
        
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let summary = movie["overview"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as? String ?? nil
        
        if posterPath == nil{
            let posterURL = ""
        }
        
        let posterURL = URL(string: baseURL + posterPath!
        )
        
        cell.titleLabel.text = title
        cell.summaryLabel.text = summary
        cell.posterView.af_setImage(withURL: posterURL!)
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller.
        
        //Find movie
        let cell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated:true)
        
    }

}
