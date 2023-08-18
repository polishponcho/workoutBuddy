import SwiftUI

struct AddWorkout: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var workoutListVM: WorkoutListVM
    @EnvironmentObject var exerciseListVM: ExerciseListVM
    
    @State var exerciseNameTextField: String = ""
    @State var exerciseRepTextField: String = ""
    @State var weightTextField: String = ""
    @State var exercises: [Exercise] = []
    @State private var showingPopover = false
    @State var saveEnabled: Bool = true
    private var exerciseXp: Int {
        var xp = 0
        for exercise in exercises {
            xp = xp + exercise.reps * exercise.weight
        }
        return xp
    }
    
    var body: some View {
        ///Add padding to workoutname text field
//        VStack {
//            VStack {
//                Text("Workout XP: \(exerciseXp)")
//            }
//            .padding()

//            Spacer()
            VStack {
                if exercises.isEmpty {
                    Text("")
                } else {
                    List {
                        ForEach(exercises, id: \.self) { exercise in
                            HStack {
                                Text("\(exercise.name)")
                                Spacer()
                                Text("\(exercise.reps) @ \(exercise.weight)lbs")
                            }
                        }
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
                }
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding()
                })
                .disabled(exerciseXp == 0)
            }
//        }
        .navigationBarItems(
            trailing: NavigationLink("Add", destination: ExerciseList())
        )
    }
    //        .navigationTitle("Create Workout")
    /// Add Validation to Not save Empty text filed (Workout Name)
    func saveButtonPressed() {
        workoutListVM.addWorkout(exercises: exercises, completedDate: Date.now, xp: calculateXp(exercises: exercises))
        presentationMode.wrappedValue.dismiss()
    }
    
    func calculateXp(exercises: [Exercise]) -> Int {
        print("calculating Xp...")
        var workoutXp = 0
        for exercise in exercises {
            print("exercise: \(exercise.name)")
            print("exerciseReps \(exercise.reps) * exerciseWeight \(exercise.weight)")
            let exerciseXp = exercise.reps * exercise.weight
            
            print("self.xp: ", exerciseXp)
            workoutXp = workoutXp + exerciseXp
        }
        
        return workoutXp / 10
    }
}



struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
