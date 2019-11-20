//
//  HomeScreenVC.swift
//  GameOfThrones
//
//  Created by Jaheed Haynes on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {
    
//   var images: [UIImage] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var gotSeasons = [[GOTEpisode]]() {
       didSet {
          tableView.reloadData()
       }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        dump(gotSeasons)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gotDetailSegueView = segue.destination as? GotSegueVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                return
        }
        
        gotDetailSegueView.episode = gotSeasons[indexPath.section][indexPath.row]
    }
    
    //    func createArray() -> [UIImage] {
    //        var tempImages: [UIImage] = []
    //
    //        let image1 = #imageLiteral(resourceName: "2583")
    //        let image2 = #imageLiteral(resourceName: "2584")
    //        let image3 = #imageLiteral(resourceName: "2585")
    //        let image4 = #imageLiteral(resourceName: "2586")
    //        let image5 = #imageLiteral(resourceName: "2587")
    //        let image6 = #imageLiteral(resourceName: "2588")
    //        let image7 = #imageLiteral(resourceName: "2589")
    //        let image8 = #imageLiteral(resourceName: "2591")
    //        let image9 = #imageLiteral(resourceName: "2593")
    //        let image10 = #imageLiteral(resourceName: "2594")
    //
    //        tempImages.append(image1)
    //        tempImages.append(image2)
    //        tempImages.append(image3)
    //        tempImages.append(image4)
    //        tempImages.append(image5)
    //        tempImages.append(image6)
    //        tempImages.append(image7)
    //        tempImages.append(image8)
    //        tempImages.append(image9)
    //        tempImages.append(image10)
    //
    //        return tempImages
    //    }
    
    
}


extension HomeScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasons[section].count
    }
    
    
    func numOfSeasonSections(in tableView: UITableView) -> Int {
    return gotSeasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCell") as? GOTTableViewCell else { fatalError("You Broke The App")}
        
        let gotEpisodePerSectionAndRow = gotSeasons[indexPath.section][indexPath.row]
        
        cell.gotCell(for: gotEpisodePerSectionAndRow)
        
        return cell
    }
    
    
}

