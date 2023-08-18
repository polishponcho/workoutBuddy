//
//  workoutTrackerApp.swift
//  workoutTracker
//
//  Created by Ryan Ratajczyk on 7/12/23.
//

import SwiftUI

@main
struct workoutTrackerApp: App {
//    let persistenceController = PersistenceController.shared
    
    @StateObject var athleteVM: AthleteVM = AthleteVM()
    @StateObject var exerciseVM: ExerciseListVM = ExerciseListVM()
    @StateObject var workoutVM: WorkoutListVM = WorkoutListVM()

    var body: some Scene {
        WindowGroup {
            NavigationView {
//                WorkoutList()
                Main()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(athleteVM)
            .environmentObject(exerciseVM)
            .environmentObject(workoutVM)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
