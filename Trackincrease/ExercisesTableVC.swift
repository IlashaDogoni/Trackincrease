//
//  ExercisesTableVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 10.08.2024.
//

import UIKit

class ExercisesTableVC: UIViewController {

    
    var exercises: [String] = ["Push-ups", "Pull-ups", "Squats", "Burpees"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
}


extension ExercisesTableVC: UITableViewDelegate, UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exercises.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") else {
        return UITableViewCell()
    }
    cell.textLabel?.text = exercises[indexPath.row]
    return  cell
     
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //  let smth = smth[indexPath.row]
  //  performSegue(withIdentifier: Segues.toDetail, sender: smth)
}
}
