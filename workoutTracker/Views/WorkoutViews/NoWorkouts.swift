import SwiftUI

struct NoWorkouts: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Create a Workout")
                    .font(.title)
                    .fontWeight(.semibold)
                NavigationLink(destination: AddWorkout(), label: {
                    Text("Add a Workout!")
                        .foregroundColor(.white)
                        .font(.headline)
                })
            }
        }
    }
}

struct NoWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        NoWorkouts()
    }
}
