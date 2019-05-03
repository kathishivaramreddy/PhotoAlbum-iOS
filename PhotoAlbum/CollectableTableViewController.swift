//
//  CollectableTableViewController.swift
//  PhotoAlbum
//
//  Created by apple on 5/3/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class CollectableTableViewController: UITableViewController {

    var collectables = [Collectable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchCollectables()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collectables.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let collectable = collectables[indexPath.row]
    
        cell.textLabel?.text = collectable.title
    
        return cell
    }
    
    private func fetchCollectables() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataCollectable = try? context.fetch(Collectable.fetchRequest()) , let collectables = coreDataCollectable as? [Collectable] {
                self.collectables = collectables
            }
        }
        tableView.reloadData()
    }
    
}
