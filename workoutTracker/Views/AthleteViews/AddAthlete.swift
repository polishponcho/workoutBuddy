//MARK: TODO:
// Weight Validation (weight < 1000 & weight > 10
// Height Validation (height < 3000 & height > 1

import SwiftUI

struct AddAthlete: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var athleteVM: AthleteVM
    @State var nameTextField: String = ""
    @State var weightTextField: String = ""
    @State var heightTextField: String = ""
    @State private var birthDate = Date.now
    
    var body: some View {
        VStack {
            //Add picture option
            Text("Athlete Profile")
                .font(.largeTitle)
                .padding()
            Text("Welecome \(nameTextField)")
                .font(.headline)
                .padding()
            TextField("Name", text: $nameTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding()
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Birthdate")
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding()
            TextField("Weight (lbs.)", text: $weightTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding()
            TextField("Height (in.)", text: $heightTextField)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding()
            Button(action: saveButtonPressed, label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding()
            })
            .disabled(nameTextField.isEmpty || weightTextField.isEmpty || heightTextField.isEmpty)
            .padding()
        }
    }
    
    func saveButtonPressed() {
        athleteVM.addAthlete(name: nameTextField, birthdate: birthDate, weight: weightTextField, height: heightTextField, completedWorkouts: [])
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddAthlete_Previews: PreviewProvider {
    var date = Date.now
    static var previews: some View {
        AddAthlete()
    }
}
