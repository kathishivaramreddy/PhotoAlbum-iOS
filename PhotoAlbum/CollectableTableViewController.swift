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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCollectables()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectables.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let collectable = collectables[indexPath.row]
    
        cell.textLabel?.text = collectable.title
        
        if let data = collectable.image {
            cell.imageView?.image = UIImage(data: data)
        }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let collectable = collectables[indexPath.row]
                context.delete(collectable)
                try? context.save()
            }
        }
        tableView.reloadData()
    }
    
}
