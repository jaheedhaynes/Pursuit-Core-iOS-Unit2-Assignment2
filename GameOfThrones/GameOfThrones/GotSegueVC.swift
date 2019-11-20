//
//  GotSegueVC.swift
//  GameOfThrones
//
//  Created by Jaheed Haynes on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GotSegueVC: UIViewController {

    @IBOutlet weak var gotImageAfterSegue: UIImageView!
    
    @IBOutlet weak var gotTitleLabelAfterSegue: UILabel!
    
    @IBOutlet weak var gotEpisodeDetailLabelSegue: UITextView!
    
    @IBOutlet weak var gotEpisodeDescriptionLabelAfterSegue: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotSegueUI()
      
    }
    
    var gotEpisode: GOTEpisode?
    
    func gotSegueUI(){
        guard let gotEpisodeTitle = gotEpisode else {
            fatalError("You broke the app!")
        }
        navigationItem.title = gotEpisodeTitle.name
        gotImageAfterSegue.image = UIImage(named: gotEpisodeTitle.originalImageID)
        gotTitleLabelAfterSegue.text = gotEpisodeTitle.name
        gotEpisodeDetailLabelSegue.text = "Season:  \(gotEpisodeTitle.season)\nEpisode: \(gotEpisodeTitle.number)\nRuntime:  \(gotEpisodeTitle.runtime)\nAirDate: \(gotEpisodeTitle.airdate)"
        gotEpisodeDescriptionLabelAfterSegue.text = gotEpisodeTitle.summary
    }

    
}
