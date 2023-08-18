//
//  Stats.swift
//  workoutTracker
//
//  Created by Ryan Ratajczyk on 7/25/23.
//

import Foundation


struct Stats {
    var completedWorkouts: [Workout] = []
    var dailyXP: Int = 0
    var totalXP: Int = 0
    
    init(completedWorkouts: [Workout]) {
        self.completedWorkouts = completedWorkouts
    }
}
