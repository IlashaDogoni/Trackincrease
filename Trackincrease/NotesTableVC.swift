//
//  NotesTableVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class NotesTableVC: UIViewController {

    
    let formatter = DateFormatter()
    
    var workoutsList : [Workout] = [Workout(date: Date(timeIntervalSinceReferenceDate: 10298397), exercises: [Exercise(name: "Push-ups", sets: [SetSet(reps: 30, weight: 0.0)])])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var workout = Workout(date: Date(timeIntervalSinceReferenceDate: 10100000), exercises: [])
        var exercise = Exercise(name: "Squats", sets: [])
        var set = SetSet(reps: 15, weight: 30.0)
        exercise.sets.append(set)
        set = SetSet(reps: 12, weight: 40.0)
        exercise.sets.append(set)
        set = SetSet(reps: 8, weight: 50.0)
        exercise.sets.append(set)
        set = SetSet(reps: 7, weight: 50.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)

        exercise = Exercise(name: "Pull-ups", sets: [])
        set = SetSet(reps: 6, weight: 0.0)
        exercise.sets.append(set)
        set = SetSet(reps: 9, weight: 0.0)
        exercise.sets.append(set)
        set = SetSet(reps: 8, weight: 0.0)
        exercise.sets.append(set)
        set = SetSet(reps: 6, weight: 0.0)
        exercise.sets.append(set)
        workout.exercises.append(exercise)
        workoutsList.append(workout)
        //print(workoutsList)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! WorkOutDetailVC
        destVC.workOutToGet = sender as? Workout
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
