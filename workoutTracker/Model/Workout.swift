import Foundation

struct Workout: Identifiable, Codable {
    let id: String
    var exercises: [Exercise]
    var completeDate: Date
    var xp: Int
    
    init(id: String = UUID().uuidString, exercises: [Exercise], completeDate: Date, xp: Int) {
        self.id = id
        self.exercises = exercises
        self.completeDate = completeDate
        self.xp = xp
    }
}
