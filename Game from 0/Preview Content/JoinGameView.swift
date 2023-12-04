import SwiftUI
import CloudKit

struct JoinGameView: View {
    @State private var enteredCode: String = ""
    @ObservedObject var gameViewModel: GameViewModel

    var body: some View {
        VStack {
            Text("Enter Game Code:")
                .font(.title)

            TextField("Game Code", text: $enteredCode)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Join Game") {
                joinGame()
            }
            .padding()
        }
        .padding()
    }

    private func joinGame() {
        // Use CloudKit to find the game session with the entered code
        // Update the gameViewModel with the session details
        // For simplicity, assume a CloudKit record type named "GameSession"
        let recordType = "Game"
        let predicate = NSPredicate(format: "gameCode == %@", enteredCode)
        let query = CKQuery(recordType: recordType, predicate: predicate)

        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            if let error = error {
                print("Error querying CloudKit: \(error.localizedDescription)")
                // Handle the error as needed
            } else if let record = records?.first {
                DispatchQueue.main.async {
                    gameViewModel.update(with: record)
                }
            } else {
                print("Game session not found.")
                // Handle the case where the game session is not found
            }
        }
    }
}

class GameViewModel: ObservableObject {
    @Published var gameCode: String = ""
    @Published var treasureCollected: Int = 0

    func update(with record: CKRecord) {
        // Extract relevant data from the CloudKit record and update the view model
        // For simplicity, assume fields "gameCode" and "treasureCollected"
        gameCode = record["gameCode"] as? String ?? ""
        treasureCollected = record["treasureCollected"] as? Int ?? 0
    }
}

struct JoinGameView_Previews: PreviewProvider {
    static var previews: some View {
        JoinGameView(gameViewModel: GameViewModel()) // Provide a default instance for the canvas preview
    }
}
