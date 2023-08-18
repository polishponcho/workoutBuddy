import Foundation

class WorkoutListVM: ObservableObject {
    
    @Published var workouts: [Workout] = [] {
        didSet {
            saveWorkouts()
        }
    }
    let workoutsKey: String = "workouts_list"
    init() {
        getWorkouts()
    }
    
    func getWorkouts() {
        guard
            let data = UserDefaults.standard.data(forKey: workoutsKey),
            let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: data)
        else { return }
        
        self.workouts = savedWorkouts
    }
    
    func addWorkout(exercises: [Exercise], completedDate: Date, xp: Int) {
        let newWorkout = Workout(exercises: exercises, completeDate: completedDate, xp: xp)
        workouts.append(newWorkout)
    }
    
    func moveWorkout(from: IndexSet, to: Int) {
        workouts.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteWorkout(indexSet: IndexSet) {
        workouts.remove(atOffsets: indexSet)
    }
    
    func updateWorkout(workout: inout Workout) {
        if let index = workouts.firstIndex(where: {$0.id == workout.id}) {
            workouts[index] = workout
        }
    }
    
    
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encodedData, forKey: workoutsKey)
        }
    }
}
