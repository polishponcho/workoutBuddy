//MARK: TODO:
//Add validation (user can't leave blank fields)
import SwiftUI

struct AddExercise: View {
    
//    @EnvironmentObject var exerciseVM: ExerciseListVM
    @State var exerciseNameTextField: String
    @State var exerciseRepTextField: String
    @State var weightTextField: String
    @State var exercises: [Exercise]
//    @Binding var xp: Int

  
    var body: some View {
        VStack {
                TextField("Add Exercise", text: $exerciseNameTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                TextField("Add Number of Reps", text: $exerciseRepTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                TextField("Weight", text: $weightTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
            
                Button(action: {
                    addExercise()
                }, label: {
                    Text("Add")
                })
        }
    }
    func addExercise() {
        print("Adding Exercise!")
        exercises.append(Exercise(name: exerciseNameTextField, reps: Int(exerciseRepTextField) ?? 0, weight: Int(weightTextField) ?? 0))
        exerciseNameTextField = ""
        exerciseRepTextField = ""
        weightTextField = ""
//        showingPopover = false
//        var exerciseXp = 0
//        for exercise in exercises {
//            exerciseXp = exercise.weight * exercise.reps
//        }
//        self.xp = exerciseXp + self.xp
        
        
    }
}
//
struct AddExercise_Previews: PreviewProvider {
    static var exerciseName = "Squat"
    static var exerciseRep = "30"
    static var exerciseWeight = "50"
    static var exercises = [Exercise(name: "Squat", reps: 30, weight: 180)]
    static var previews: some View {
        AddExercise(exerciseNameTextField: exerciseName, exerciseRepTextField: exerciseRep, weightTextField: exerciseWeight, exercises: exercises)
    }
}
