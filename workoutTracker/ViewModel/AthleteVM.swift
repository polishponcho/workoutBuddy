import Foundation

class AthleteVM: ObservableObject {
    
    @Published var athlete: Athlete = Athlete(name: "", birthdate: Date.now, weight: "", height: "") {
        didSet {
            saveAthlete()
        }
    }
    let athleteKey: String = "athlete_key"
    init() {
        getAthlete()
    }
    
    func getAthlete() {
        guard
            let data = UserDefaults.standard.data(forKey: athleteKey),
            let savedAthlete = try? JSONDecoder().decode(Athlete.self, from: data)
        else { return }
        
        self.athlete = savedAthlete
    }
    
    func saveAthlete() {
        if let encodedData = try? JSONEncoder().encode(athlete) {
            UserDefaults.standard.set(encodedData, forKey: athleteKey)
        }
    }
    
    func addAthlete(name: String, birthdate: Date, weight: String, height: String, completedWorkouts: [Workout]) {
        let newAthlete = Athlete(name: name, birthdate: birthdate, weight: weight, height: height)
        athlete = newAthlete
    }
    
    func completeWorkout(workout: Workout) {
        let completedWorkout = Workout(exercises: workout.exercises, completeDate: workout.completeDate, xp: workout.xp)
    }
    
    func updateAthlete(updatedAthlete: inout Athlete) {
        athlete = updatedAthlete
    }
}
