//
//  DetailViewController.swift
//  Flix_demo
//
//  Created by Joseph Kwak on 9/11/18.
//  Copyright © 2018 Joseph Kwak. All rights reserved.
//

import UIKit
enum moviekeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterpath = "poster_path"
}
class DetailViewController: UIViewController {

    @IBOutlet weak var BackDropImageView: UIImageView!
    
    
    @IBOutlet weak var PosterImageView: UIImageView!
    
    @IBOutlet weak var OverviewLabel: UILabel!
    @IBOutlet weak var ReleaseDateLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        if let movie = movie{
            TitleLabel.text = movie[moviekeys.title] as? String //labels can actually take an optional and if it is nil it wont show anything
            ReleaseDateLabel.text = movie["release_date"] as? String
            OverviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie[moviekeys.backdropPath] as! String
            let posterpathstring = movie[moviekeys.posterpath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500/"
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            BackDropImageView.af_setImage(withURL: backdropURL)
            
            let posterpathURL = URL(string: baseURLString + posterpathstring)!
            PosterImageView.af_setImage(withURL: posterpathURL)
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resourcebs that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
