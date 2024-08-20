//
//  ExercisesTableVC.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 10.08.2024.
//

import UIKit

class ExercisesTableVC: UIViewController {

    
    var dataToSendBack: [WorkoutStruct]?
    
    struct AllDataToSend{
        let nameToSend: String
        let arrayToSend : [WorkoutStruct]
    }
    
    var receivedData: [WorkoutStruct]?
    var receivedDataFromAWVC: [WorkoutStruct]?
    var exercises: [String] = ["Push-ups", "Pull-ups", "Squats", "Burpees"]
    
    var tempArray: [WorkoutStruct]?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = receivedData {
                    print("Received data: \(data)\n\n ________________________")
                }
         tempArray = receivedData
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataFromVC2(_:)), name: Notification.Name("DataFromAWVC"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        setDataToSendBack(data: (receivedDataFromAWVC ?? tempArray)!)

                  // Check if the view controller is being popped
            if self.isMovingFromParent {
                if let data = dataToSendBack {
                            NotificationCenter.default.post(name: Notification.Name("DataFromExercisesTableVC"), object: data)
                        } else {
                            print("dataToSendBack is nil")
                        }
            }
        }
    
    @objc func handleDataFromVC2(_ notification: Notification) {
            if let dataFromAWVC = notification.object as? [WorkoutStruct] {
                receivedDataFromAWVC = dataFromAWVC
                print(".\n\n\nReceived data from AWvC: \(receivedDataFromAWVC)")
            } else {
                print("No data got from AWVC")
            }
        }
    
    deinit {
            // Remove observer when VC1 is deallocated
            NotificationCenter.default.removeObserver(self, name: Notification.Name("DataFromVC2"), object: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ActualWorkingOutVC 
        destVC.dataToGet = sender as? String
        
        if segue.identifier == "ToActualWorkingOutVC" {
                if let destVC = segue.destination as? ActualWorkingOutVC,
                   let dataToGet = sender as? AllDataToSend {
                    destVC.arrayToGet = dataToGet.arrayToSend
                    destVC.dataToGet = dataToGet.nameToSend
                }
            }
        
        
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
   let nameToSend = exercises[indexPath.row]
    let arrayToSend = receivedData
    let dataToSend = AllDataToSend(nameToSend: nameToSend, arrayToSend: arrayToSend!)
    
   performSegue(withIdentifier: "ToActualWorkingOutVC", sender: dataToSend)
}
    func setDataToSendBack(data: [WorkoutStruct]) {
           self.dataToSendBack = data
        }
    
   
}
