//
//  NotesTableVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import UIKit

class NotesTableVC: UIViewController {

    var receivedData   : [WorkoutStruct]?
    var workoutsList : [WorkoutStruct] = []
    let formatter = DateFormatter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = receivedData {
            workoutsList = receivedData!
                    print("Received data: \(data)\n\n ________________________")
        } else {
            print("No data has been received")
        }
        
        
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
