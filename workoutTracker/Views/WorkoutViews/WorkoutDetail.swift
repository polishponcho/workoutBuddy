import SwiftUI

struct WorkoutDetail: View {
    let workout: Workout
    
    @EnvironmentObject var athleteVM: AthleteVM
    @State var workoutXp: Int
    //can save?
    
    var body: some View {
        NavigationStack {
            VStack
            {
                Text(dateString(date: workout.completeDate))
                    .font(.largeTitle)
                    .padding()
                Text("XP: \(workout.xp)")
                    .font(.title)
                    .padding()
                ForEach(workout.exercises) { exercise in
                    HStack{
                        Text(exercise.name)
                        Spacer()
                        Text("\(exercise.reps) reps")
                        Text("@ \(exercise.weight)lbs")
                    }
                    .padding()
                }
            }
        }
    }
    
    func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YY, MMM d, hh:mm"
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
}

struct WorkoutDetail_Previews: PreviewProvider {
    //    static var workout1 = Workout(id: "0", name: "Titan", rounds: 4, exercises: [Exercise(id: "0", name: "Squat")], xp: 100)
    static var exercise1 = Exercise(name: "Squat", reps: 10, weight: 25)
    static var exercise2 = Exercise(name: "Lunges", reps: 20, weight: 25)
    static var workout2 = Workout(exercises: [exercise1, exercise2], completeDate: Date.now, xp: 100)
    static var previews: some View {
        WorkoutDetail(workout: workout2, workoutXp: 100)
    }
}
