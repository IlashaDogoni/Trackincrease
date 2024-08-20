//
//  SelectionVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 10.08.2024.
//

import UIKit

class SelectionVC: UIViewController {
    
    var dataToSend: [WorkoutStruct]?
    
    var dataToSendToNotes : [WorkoutStruct]?
    
    var receivedDataFromETVC: [WorkoutStruct]?

    var workoutsList : [WorkoutStruct] = [WorkoutStruct(date: Date(timeIntervalSinceReferenceDate: 10298397), exercises: [ExerciseItem(name: "Push-ups", sets: [SetItem(reps: 30, weight: 0.0)])])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var workout = WorkoutStruct(date: Date(timeIntervalSinceReferenceDate: 10100000), exercises: [])
        var exercise = ExerciseItem(name: "Squats", sets: [])
        var set = SetItem(reps: 15, weight: 30.0)
        exercise.sets.append(set)
        set = SetItem(reps: 7, weight: 50.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)

        exercise = ExerciseItem(name: "Pull-ups", sets: [])
        set = SetItem(reps: 6, weight: 0.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)
        workoutsList.append(workout)
        
        dataToSend = workoutsList
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataFromExercisesTableVC(_:)), name: Notification.Name("DataFromExercisesTableVC"), object: nil)
    
    }
    
   
 //   @IBAction func notesButtonTapped(_ sender: UIButton) {
   //     print("Notes button tapped, performing segue to NotesTableVC")
     //   performSegue(withIdentifier: "toNotesVC", sender: nil)
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing for segue with identifier: \(segue.identifier ?? "nil")")
        if segue.identifier == "toExercisesVC" {
            if let destinationVC = segue.destination as? ExercisesTableVC {
                destinationVC.receivedData = dataToSend
                print("Sending data to ExercisesTableVC: \(dataToSend)")
            } } else if segue.identifier == "toNotesVC" {
                    if let destinationVC = segue.destination as? NotesTableVC {
                        destinationVC.receivedData = dataToSend 
                        print("Sending data to NotesTableVC: \(dataToSend)")
                    } else {
                        print("Destination VC is not NotesTableVC")

                    }
                } else {
                    print("Segue identifier not recognized")
                }
            
       // print("DATA TO SEND DATA TO SEND DATA TO SEND DATA TO SEND DATA TO SEND", dataToSend)
        }
    
   
    
    @objc func handleDataFromExercisesTableVC(_ notification: Notification) {
            if let dataFromETVC = notification.object as? [WorkoutStruct] {
                receivedDataFromETVC = dataFromETVC
                workoutsList = receivedDataFromETVC!
                dataToSend = workoutsList
                print("\n\nReceived data from ExTableVC: \(receivedDataFromETVC)")
            } else {
                print("No data got from AWVC")
            }
        }
    
    deinit {
            // Remove observer when VC1 is deallocated
            NotificationCenter.default.removeObserver(self, name: Notification.Name("DataFromExercisesTableVC"), object: nil)
        }
    
}
