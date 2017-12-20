//
//  ViewController.swift
//  CarMiles
//
//  Created by Meehan, Christopher on 3/8/17.
//  Copyright © 2017 Meehan, Christopher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var volvoMiles: UITextField!
    @IBOutlet weak var explorerMiles: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var explorerResultsLabel: UILabel!
    @IBAction func calculateWasSelected(_ sender: Any) {
        if let volvoCurrentMiles = volvoMiles.text, let explorerCurrentMiles = explorerMiles.text {
            if let volvoMilesInt = Int(volvoCurrentMiles), let explorerMilesInt = Int(explorerCurrentMiles) {
                var volvoStartDateString = "2017-2-27" // change to your date format
                var explorerStartDateString = "2017-3-7" // change to your date format
                var dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY-MM-dd"
                
                if let volvoStartDate = dateFormatter.date(from: volvoStartDateString), let explorerStartDate = dateFormatter.date(from: explorerStartDateString) {

                    var howManyDaysWeveHadTheVolvo = daysBetween(start: volvoStartDate, end: Date())
                    var howManyDaysWeveHadTheExplorer = daysBetween(start: explorerStartDate, end: Date())
                    
                    var volvoAllowedMilesPerDay = 27.397
                    var explorerAllowedMilesPerDay = 28.767
                    
                    var volvoMilesIveDriven = Double(volvoMilesInt - 126)
                    var explorerMilesIveDriven = Double(explorerMilesInt - 46)
                    
                    var volvoMilesIShouldHaveDriven = volvoAllowedMilesPerDay * Double(howManyDaysWeveHadTheVolvo)
                    var explorerMilesIShouldHaveDriven = explorerAllowedMilesPerDay * Double(howManyDaysWeveHadTheExplorer)
                    
                    
                    // We got all varaibles.   Let's compute.
                    
                    if volvoMilesIShouldHaveDriven < volvoMilesIveDriven {
                        resultsLabel.textColor = UIColor.red
                        resultsLabel.text = "The Volvo is over \(volvoMilesIveDriven - volvoMilesIShouldHaveDriven) miles"
                    }
                    else {
                        resultsLabel.textColor = UIColor.green
                        resultsLabel.text = "The Volvo has \(volvoMilesIShouldHaveDriven - volvoMilesIveDriven) miles credit"
                    }

                    if explorerMilesIShouldHaveDriven < explorerMilesIveDriven {
                        explorerResultsLabel.textColor = UIColor.red
                        explorerResultsLabel.text = "The Explorer is over \(explorerMilesIveDriven - explorerMilesIShouldHaveDriven) miles"
                    }
                    else {
                        explorerResultsLabel.textColor = UIColor.green
                        explorerResultsLabel.text = "The Explorer has \(explorerMilesIShouldHaveDriven - explorerMilesIveDriven) miles credit"
                    }

                }
                
                
                

                
                

            }

        }
    }
    
    public func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volvoMiles.text = "0"
        explorerMiles.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

