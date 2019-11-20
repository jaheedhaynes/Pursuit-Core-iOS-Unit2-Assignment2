//
//  HomeScreenVC.swift
//  GameOfThrones
//
//  Created by Jaheed Haynes on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    
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
        gotInfoLoad()
        tableView.dataSource = self
        
       
        //        gotEpisodes = GOTEpisode.gotSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gotDetailSegueView = segue.destination as? GotSegueVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("You Broke The App")
        }
        gotDetailSegueView.gotEpisode = gotEpisodes[indexPath.section][indexPath.row]
    }
    
    
}


extension HomeScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodes[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gotEpisodes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let image = images[indexPath.row]
        
        var cell: GOTTableViewCell!
        
        if indexPath.section % 2 == 0 {
            guard let gCell =
            tableView.dequeueReusableCell(withIdentifier: "GOTTableViewLeftCell") as? GOTTableViewCell else { fatalError("You Broke The App")
            }
            cell = gCell
            
        } else {
            guard let gotCell =
            tableView.dequeueReusableCell(withIdentifier: "GOTTableViewRightCell") as? GOTTableViewCell else { fatalError("You Broke The App")
                
            }
            cell = gotCell
        }
        let gotEpisodePerSectionAndRow = gotEpisodes[indexPath.section][indexPath.row]
        
        cell.gotCell(for: gotEpisodePerSectionAndRow)
        
        return cell
    }
    
    // method to seperate seasons
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotEpisodes[section].first!.season)"
    }
}


