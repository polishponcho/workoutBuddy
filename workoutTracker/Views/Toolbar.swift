//
//  Toolbar.swift
//  workoutTracker
//
//  Created by Ryan Ratajczyk on 8/7/23.
//

import SwiftUI

struct Toolbar: View {
    
    @EnvironmentObject var athleteVM: AthleteVM
    @EnvironmentObject var workoutVM: WorkoutListVM
    
    var body: some View {
        NavigationStack {
            Text("Hello \(athleteVM.athlete.name)")
                .font(.largeTitle)
                .padding()
//            Text("\(createDate())")
//                .padding()
//                .navigationTitle("Workout Buddy")
//            Text(calculateStreak())
//                .font(.title)
            Image(systemName: "flame.circle")
                .font(Font.system(.largeTitle))
                .foregroundColor(.white)
        }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    GroupBox {
                        HStack {
                            NavigationLink(destination: WorkoutList()) {
                                Label("", systemImage: "dumbbell")
                            }
                            Spacer()
                            NavigationLink(destination: ExerciseList()) {
                                Label("", systemImage: "figure.mixed.cardio")
                            }
                            Spacer()
                            NavigationLink(destination: AthleteProfile()) {
                                Label("", systemImage: "person.fill")
                            }
                        }
                    }
                }
            }
            .padding()
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}
