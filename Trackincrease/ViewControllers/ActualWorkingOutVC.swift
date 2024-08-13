//
//  ActualWorkingOutVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class ActualWorkingOutVC: UIViewController {

    var dataToGet : String?
    var testWorkOut : WorkoutStruct  = WorkoutStruct(date: Date(), exercises: [])
    
    @IBOutlet var repsAmountTextField: UITextField!
    @IBOutlet var weightAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataToGet ?? "Unknown Exercise"
        
        repsAmountTextField.keyboardType = .numberPad
        weightAmountTextField.keyboardType = .decimalPad
    }
    
    func saveActualWorkOut(){
        var newWorkout = WorkoutStruct(date: Date(), exercises: [])
        var exercise = ExerciseItem(name: self.title!, sets: [])
        let reps = NumberFormatter().number(from: repsAmountTextField.text!) as! Int
        var weight : Double = 0.0
        var weightString : String = weightAmountTextField.text ?? "Empty string"
        weightString = weightString.replacingOccurrences(of: ",", with: ".")

        if let actualWeight = Double(weightString){
            weight = actualWeight.cutOff()
        }
        
        let set = SetItem(reps: reps, weight: weight)
        exercise.sets.append(set)
        newWorkout.exercises.append(exercise)
        testWorkOut = newWorkout
    }
    
    @IBAction func saveWorkOutButton(_ sender: UIButton) {
        if repsAmountTextField.text != ""{
            saveActualWorkOut()
            print(testWorkOut)
        }
    }
    
}

