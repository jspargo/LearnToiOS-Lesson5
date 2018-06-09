//
//  ViewController.swift
//  LearnToiOS-Lesson4
//
//  Created by Mike Robinson on 04/06/2018.
//  Copyright © 2018 Mike Robinson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  let modelController = ModelController.shared

    override func viewDidLoad() {
        Network().getData { (dataString) in
            print(dataString)
        }
    }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.modelController.itemCount
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    
    let name = self.modelController.nameOfItem(at: indexPath.row)
    cell.textLabel?.text = name
    
    self.modelController.loadAvatarImageOfItem(at: indexPath.row) { image, row in
      if row == indexPath.row {
        cell.imageView?.image = image
      }
    }
    
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let destinationVC = segue.destination as? DetailViewController,
      let cell = sender as? UITableViewCell {
      
      if let indexPath = tableView.indexPath(for: cell) {
        
        let selectedIndexPath: IndexPath
        
        if let _ = segue.source as? RecentsTableViewController {
          selectedIndexPath = modelController.recentItemsIndexPath(for: indexPath)
          
        } else if let _ = segue.source as? ViewController {
          selectedIndexPath = indexPath
          
        } else {
          selectedIndexPath = IndexPath(item: 0, section: 0)
        }
        
        modelController.addRecent(for: selectedIndexPath.row)
        destinationVC.selectedIndexPath = selectedIndexPath
      }
    }
  }
}

