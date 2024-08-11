//
//  WorkOutDetailVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class WorkOutDetailVC: UIViewController {
    
    var workOutToGet: Workout?

    @IBOutlet var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let worrrk = workOutToGet
        print(worrrk ?? "NIH")
        showDetails(workout: worrrk!)
        
    }
    
    func showDetails(workout: Workout){
        let workout = workout
        var detailsString = "\(workout.date)"
        
        for exersise in workout.exercises{
            detailsString += "\n\n\(exersise.name)"
            let sets = exersise.sets
            
            for setSet in exersise.sets{
                let reps = setSet.reps
                detailsString += "\n\(reps)"
                
                let weight = setSet.weight
                if weight != 0.0{
                    detailsString += " x \(weight)"
                }
            }
        }
        detailLabel.text = detailsString
    }
}
