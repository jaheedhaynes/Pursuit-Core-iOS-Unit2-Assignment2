//
//  GOTTableViewCell.swift
//  GameOfThrones
//
//  Created by Jaheed Haynes on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GOTTableViewCell: UITableViewCell {
    
    @IBOutlet weak var GOTImageView: UIImageView!
    
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
    @IBOutlet weak var seasonEpisodeNum: UILabel!
    
    func gotCell(for gotCellepisode: GOTEpisode) {
        GOTImageView.image = UIImage(named: gotCellepisode.mediumImageID)
        episodeTitleLabel.text = gotCellepisode.name
        seasonEpisodeNum.text = "Season:\(gotCellepisode.season) Episode:\(gotCellepisode.number)"
        
        episodeTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
}

