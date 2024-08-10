//
//  Data.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import Foundation

class Note {
    var date: Date
    var exerciseName: String
    var reps : [Int]
    var weight : [Double]
    init(date: Date, exerciseName: String, reps: Int, weight: Double){
        self.date = date
        self.exerciseName = exerciseName
        self.reps = [reps]
        self.weight = [weight]
    }
}

    var notes = [
        Note(date: Date(timeIntervalSinceReferenceDate: 10298397), exerciseName: "Pull-up", reps: 12, weight: 0),
        Note(date: Date(timeIntervalSinceReferenceDate: 10298397), exerciseName: "Sit-up", reps: 20, weight: 0),
        Note(date: Date(timeIntervalSinceReferenceDate: 10298397), exerciseName: "Burpee", reps: 10, weight: 0),
        Note(date: Date(timeIntervalSinceReferenceDate: 10298397), exerciseName: "Pull-up", reps: 10, weight: 0)
    ]
