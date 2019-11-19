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
    
    @IBOutlet weak var seasonNum: UILabel!
    
    @IBOutlet weak var episodeNum: UILabel!
    
    func gotCell(for gotCellepisode: GOTEpisode) {
        GOTImageView.image = imageView?.image
        episodeTitleLabel.text
        seasonNum.text
        episodeNum.text
    }
    
}

