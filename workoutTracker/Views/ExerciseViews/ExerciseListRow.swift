//
//  ExerciseListRow.swift
//  workoutTracker
//
//  Created by Ryan Ratajczyk on 7/15/23.
//

import SwiftUI

struct ExerciseListRow: View {
    let exercise: Exercise
    var body: some View {
        HStack {
            Text(exercise.name)
                .padding()
        }
    }
}

//struct ExerciseListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseListRow()
//    }
//}
