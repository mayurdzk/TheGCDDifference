//
//  ViewController.swift
//  TheGCDDifference
//
//  Created by Mayur on 15/08/17.
//  Copyright © 2017 Mayur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let toShowConcurrently = sender as! Bool
        let destinationVC = segue.destination as! DetailViewController
        
        destinationVC.isShowingConcurrency = toShowConcurrently
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        if indexPath.row == 0 {
            cell.bigLabel.text = "Without GCD"
        } else {
            cell.bigLabel.text = "With GCD"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "ShowDetail", sender: false)
        } else {
            performSegue(withIdentifier: "ShowDetail", sender: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
}

class Cell: UITableViewCell {
    @IBOutlet var bigLabel: UILabel!
}
