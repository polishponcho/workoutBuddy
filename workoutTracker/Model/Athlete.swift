import Foundation

struct Athlete: Identifiable, Codable {
    let id: String
    let name: String
    let birthdate: Date
    var weight: String
    var height: String
    
    init(id: String = UUID().uuidString, name: String, birthdate: Date, weight: String, height: String) {
        self.id = id
        self.name = name
        self.birthdate = birthdate
        self.weight = weight
        self.height = height
    }
}
