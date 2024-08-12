//
//  Data.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 11.08.2024.
//

import Foundation

struct Workout {
    var date: Date
    var exercises: [Exercise]
}

struct Exercise {
    var name: String
    var sets: [SetSet]
}

struct SetSet {
    var reps: Int
    var weight: Double
}
