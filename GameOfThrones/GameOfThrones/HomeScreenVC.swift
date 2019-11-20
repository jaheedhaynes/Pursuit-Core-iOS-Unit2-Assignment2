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
    
    var gotEpisodes = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func gotInfoLoad(){
        gotEpisodes = GOTEpisode.gotSections()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        gotInfoLoad()
        //        gotEpisodes = GOTEpisode.gotSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gotDetailSegueView = segue.destination as? GotSegueVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("You Broke The App")
        }
        gotDetailSegueView.gotEpisode = gotEpisodes[indexPath.section][indexPath.row]
    }
    
    //------------------------------------------------------------------------------------------------------
    
    // ** Early Test **
    
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
    
    //------------------------------------------------------------------------------------------------------
    
    
}


extension HomeScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodes[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gotEpisodes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let image = images[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCell") as? GOTTableViewCell else { fatalError("You Broke The App")}
        
        let gotEpisodePerSectionAndRow = gotEpisodes[indexPath.section][indexPath.row]
        
        cell.gotCell(for: gotEpisodePerSectionAndRow)
        
        return cell
    }
    
    
    //------------------------------------------------------------------------------------------------------
    // Methods for the Season Sections
    
    func numOfSeasonSections(in tableView: UITableView) -> Int {
        return gotEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotEpisodes[section].first!.season)"
    }
    
    //    //------------------------------------------------------------------------------------------------------
    //            // Methods for delegation
    //
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
    
    
}

