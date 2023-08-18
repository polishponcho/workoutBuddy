import Foundation

struct Exercise: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    var reps: Int
    var weight: Int
    var type: String?
    
    init(id: String = UUID().uuidString, name: String, reps: Int, weight: Int) {
        self.id = id
        self.name = name
        self.reps = reps
        self.weight = weight
    }
}
