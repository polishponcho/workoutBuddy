import SwiftUI

struct ExerciseList: View {
    @EnvironmentObject var exerciseVM: ExerciseListVM
    
    var body: some View {
        ZStack {
            if exerciseVM.exercises.isEmpty {
                Text("No Exercises")
            } else {
                List {
                    ForEach(exerciseVM.exercises.indices, id: \.self) { index in
                        NavigationLink(destination: ExerciseDetail(exercise: exerciseVM.exercises[index])) {
                            ExerciseListRow(exercise: exerciseVM.exercises[index])
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        var exercise = exerciseVM.exercises[index]
                                        exerciseVM.updateExercise(exercise: &exercise)
                                    }
                                }
                        }
                    }
                    .onDelete(perform: exerciseVM.deleteExercise)
                    .onMove(perform: exerciseVM.moveExercise)
                    .listStyle(PlainListStyle())
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddExercise(exerciseNameTextField: "", exerciseRepTextField: "", weightTextField: "", exercises: exerciseVM.exercises))
        )
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList()
    }
}
