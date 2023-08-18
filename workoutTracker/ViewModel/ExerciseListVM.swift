import Foundation

class ExerciseListVM: ObservableObject {
    
    @Published var exercises: [Exercise] = [] {
        didSet {
            saveExercises()
        }
    }
    let exercisesKey: String = "exercises_list"
    init() {
        getExercises()
    }
    
    func getExercises() {
        guard
            let data = UserDefaults.standard.data(forKey: exercisesKey),
            let savedExercises = try? JSONDecoder().decode([Exercise].self, from: data)
        else { return }
        
        self.exercises = savedExercises
    }
    
    func addExercise(name: String, reps: Int, weight: Int) {
        let newExercise = Exercise(name: name, reps: reps, weight: weight)
        exercises.append(newExercise)
    }
    
    func saveExercises() {
        if let encodedData = try? JSONEncoder().encode(exercises) {
            UserDefaults.standard.set(encodedData, forKey: exercisesKey)
        }
    }
    
    func moveExercise(from: IndexSet, to: Int) {
        exercises.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteExercise(indexSet: IndexSet) {
        exercises.remove(atOffsets: indexSet)
    }
    
    
    func updateExercise(exercise: inout Exercise) {
        if let index = exercises.firstIndex(where: {$0.id == exercise.id}) {
            exercises[index] = exercise
        }
    }
}
