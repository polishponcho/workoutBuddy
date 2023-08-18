//MARK: TODO:
// delete exercise capability (swipe)
import SwiftUI
import Foundation

struct WorkoutList: View {
    
    @EnvironmentObject var workoutVM: WorkoutListVM
    @EnvironmentObject var exerciseVM: ExerciseListVM
    
    var body: some View {
        ZStack {
            if workoutVM.workouts.isEmpty {
                NoWorkouts()
            } else {
                VStack {
                    Text("Completed Workouts")
                        .font(.title)
                    List {
                        ForEach(workoutVM.workouts.indices, id: \.self) { index in
                            NavigationLink(destination: WorkoutDetail(workout: workoutVM.workouts[index], workoutXp:
                                                                        workoutVM.workouts[index].xp)) {
                                WorkoutListRowView(workout: workoutVM.workouts[index])
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            var workout = workoutVM.workouts[index]
                                            workoutVM.updateWorkout(workout: &workout)
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: workoutVM.deleteWorkout)
                        .onMove(perform: workoutVM.moveWorkout)
                        .listStyle(PlainListStyle())
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: NavigationLink("Add", destination: ExerciseList())
        )
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutList()
        }
        .environmentObject(WorkoutListVM())
    }
}
