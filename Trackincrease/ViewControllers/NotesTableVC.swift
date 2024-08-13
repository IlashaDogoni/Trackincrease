//
//  NotesTableVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class NotesTableVC: UIViewController {

    
    let formatter = DateFormatter()
    
    var workoutsList : [WorkoutStruct] = [WorkoutStruct(date: Date(timeIntervalSinceReferenceDate: 10298397), exercises: [ExerciseItem(name: "Push-ups", sets: [SetItem(reps: 30, weight: 0.0)])])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var workout = WorkoutStruct(date: Date(timeIntervalSinceReferenceDate: 10100000), exercises: [])
        var exercise = ExerciseItem(name: "Squats", sets: [])
        var set = SetItem(reps: 15, weight: 30.0)
        exercise.sets.append(set)
        set = SetItem(reps: 12, weight: 40.0)
        exercise.sets.append(set)
        set = SetItem(reps: 8, weight: 50.0)
        exercise.sets.append(set)
        set = SetItem(reps: 7, weight: 50.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)

        exercise = ExerciseItem(name: "Pull-ups", sets: [])
        set = SetItem(reps: 6, weight: 0.0)
        exercise.sets.append(set)
        set = SetItem(reps: 9, weight: 0.0)
        exercise.sets.append(set)
        set = SetItem(reps: 8, weight: 0.0)
        exercise.sets.append(set)
        set = SetItem(reps: 6, weight: 0.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)
        workoutsList.append(workout)
        //print(workoutsList)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! WorkOutDetailVC
        destVC.workOutToGet = sender as? WorkoutStruct
    }

}



extension NotesTableVC: UITableViewDelegate, UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workoutsList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell") else {
        return UITableViewCell()
    }
    formatter.dateFormat = "dd/MMM/yyyy"
    cell.textLabel?.text = formatter.string(from: workoutsList[indexPath.row].date)
    return  cell
     
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let workoutToSend = workoutsList[indexPath.row]
    performSegue(withIdentifier: "ToWorkOutDetailVC", sender: workoutToSend )
}
}
