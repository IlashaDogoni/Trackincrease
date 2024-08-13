//
//  Data.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import Foundation

struct WorkoutStruct {
    var date: Date
    var exercises: [ExerciseItem]
}

struct ExerciseItem {
    var name: String
    var sets: [SetItem]
}

struct SetItem {
    var reps: Int
    var weight: Double
}
