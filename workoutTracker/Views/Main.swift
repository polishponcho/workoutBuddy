import Foundation
import SwiftUI

struct Main: View {
    
    @EnvironmentObject var athleteVM: AthleteVM
    @EnvironmentObject var exerciseVM: ExerciseListVM
    @EnvironmentObject var workoutVM: WorkoutListVM
    
    func createDate() -> Text {
        let today = Date.now
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .full
        return Text(formatter1.string(from: today)).font(.title)
    }
    
    func calculateStreak() -> String {
        print("calculating streak")
        var streak = 0
        let workouts = workoutVM.workouts
        var currentDate = Date.now
        
        for workout in workouts.reversed() {
            if !Calendar.current.isDate(currentDate, inSameDayAs: workout.completeDate) {
                break
            }
            streak += 1
            currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        }
        return String(streak)
    }
    
    
    var body: some View {
        
        
        if athleteVM.athlete.name == "" {
            AddAthlete()
        } else {
            Toolbar()
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .environmentObject(AthleteVM())
            .environmentObject(WorkoutListVM())
            .environmentObject(ExerciseListVM())
    }
}
