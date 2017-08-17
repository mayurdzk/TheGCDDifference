//
//  DetailViewController.swift
//  TheGCDDifference
//
//  Created by Mayur on 15/08/17.
//  Copyright © 2017 Mayur. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var viewDidLoadTimeLabel: UILabel!
    @IBOutlet weak var viewDidAppearTimeLabel: UILabel!
    @IBOutlet weak var timeDifferenceLabel: UILabel!
    @IBOutlet weak var timeComputationCompletedLabel: UILabel!
    
    var viewDidLoadTime: Date!
    var viewDidAppearTime: Date!
    
    var isShowingConcurrency = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = Date()
        viewDidLoadTime = now
        viewDidLoadTimeLabel.text = "\(now)"
        doComplexWork(concurrently: isShowingConcurrency)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let now = Date()
        viewDidAppearTime = now
        viewDidAppearTimeLabel.text = "\(now)"
        timeDifferenceLabel.text = "\(viewDidAppearTime.timeIntervalSince(viewDidLoadTime))"
    }
    
    func doComplexWork(concurrently: Bool) {
        if concurrently {
            DispatchQueue.global(qos: .background).async {
                self.complexWork()
                DispatchQueue.main.async {
                    self.updateComputationCompletedLabel()
                }
            }
        } else {
            complexWork()
            updateComputationCompletedLabel()
        }
    }
    
    func complexWork() {
        //This is a simulation of 'Complex work', of course
        var string = String()
        
        for _ in 0...10000 {
            string = ""
            for i in 0...1000 {
                string += "\(i)"
            }
        }
    }
    
    func updateComputationCompletedLabel() {
        //Must be called on the main thread since we're dealing with a UILabel.
        //UI manipulation must only happen on the main thread.
        timeComputationCompletedLabel.text = "\(Date())"
    }
    
}
