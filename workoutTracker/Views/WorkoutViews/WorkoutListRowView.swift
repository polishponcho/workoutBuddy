import SwiftUI
import Foundation

struct WorkoutListRowView: View {
    let workout: Workout
    
    var body: some View {
        HStack {
            Text(dateString(date: workout.completeDate))
                .padding()
        }
    }
    
    func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

struct WorkoutListView_Previews: PreviewProvider {
//    static var workout1 = Workout(id: "0", name: "Titan", rounds: 4, exercises: [Exercise(id: "0", name: "Squat")], xp: 100)
    static var workout2 = Workout(exercises: [Exercise(name: "Squat", reps: 10, weight: 25)], completeDate: Date.now, xp: 100)
    static var previews: some View {
        WorkoutListRowView(workout: workout2)
    }
}
