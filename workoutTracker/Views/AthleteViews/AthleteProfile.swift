import Foundation
import SwiftUI

struct AthleteProfile: View {
    
    @EnvironmentObject var athleteVM: AthleteVM
    
    var body: some View {
        VStack {
            VStack {
                Text("\(athleteVM.athlete.name)")
                    .font(.largeTitle)
                Text("\(athleteVM.athlete.weight) lbs.")
                Text("\(athleteVM.athlete.height) in.")
            }
//            Spacer()
            VStack {
                Text("Today's XP: ")
                Text("Lifetime XP: ")
            }
            VStack {
                Text("Completed Workouts")
//                List {
//                    ForEach(athleteVM.athlete.completedWorkouts?.indices, id: \.self) { index in
//                        NavigationLink(destination: CompletedWorkoutDetail(completedWorkout: athleteVM.athlete.completedWorkouts?[index], rounds: 10)) {
//                            Text("\(athleteVM.athlete.completedWorkouts[index].name)")
//                        }
//                        .navigationTitle("GEneral")
//                    }
//                }
            }
        }
    }
}

struct AthleteProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AthleteProfile()
        }
        .environmentObject(AthleteVM())
    }
}
