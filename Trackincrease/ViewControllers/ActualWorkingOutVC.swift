//
//  ActualWorkingOutVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class ActualWorkingOutVC: UIViewController {

    
    var dataToSendBack : [WorkoutStruct]?
    var dataToGet      : String?
    var arrayToGet     : [WorkoutStruct]?
    var testWorkOut    : WorkoutStruct  = WorkoutStruct(date: Date(), exercises: [])
    var testWorkOutArray : [WorkoutStruct] = []
    
    @IBOutlet var repsAmountTextField: UITextField!
    @IBOutlet var weightAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataToGet ?? "Unknown Exercise"
        if let dataGotten = arrayToGet {
                    print("Received data: \(dataGotten)\n\n ________________________")
                }
        testWorkOutArray = arrayToGet!
        
        repsAmountTextField.keyboardType = .numberPad
        weightAmountTextField.keyboardType = .decimalPad
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            // Check if the view controller is being popped
            if self.isMovingFromParent {
                if let data = dataToSendBack {
                            NotificationCenter.default.post(name: Notification.Name("DataFromAWVC"), object: data)
                        } else {
                            print("dataToSendBack is nil")
                        }
            }
        }
    
    func saveActualWorkOut() -> WorkoutStruct{
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
        var contArray = arrayToGet
        contArray?.append(testWorkOut)
        
        return newWorkout
    }
    
    @IBAction func saveWorkOutButton(_ sender: UIButton) {
        if repsAmountTextField.text != ""{
            testWorkOutArray.append(saveActualWorkOut())
            print(testWorkOut)
            print(testWorkOutArray)
            setDataToSendBack(data: testWorkOutArray)
        }
    }
    
    func setDataToSendBack(data: [WorkoutStruct]) {
           self.dataToSendBack = data
        }
}

