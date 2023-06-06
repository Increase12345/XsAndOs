//
//  StartView.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var game: GameService
    @StateObject var vm = StartViewViewModel()
    @StateObject var connectionManager: MPConnectionManager
    @State private var gameType: GameType = .undetermined
    @AppStorage("yourName") var yourName = ""
    @FocusState var focus: Bool
    
    init(yourName: String) {
        self.yourName = yourName
        _connectionManager = StateObject(wrappedValue: MPConnectionManager(yourName: yourName))
    }
    
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type")
                    .tag(GameType.undetermined)
                Text("Two Sharing device")
                    .tag(GameType.single)
                Text("Challenge your device")
                    .tag(GameType.bot)
                Text("Challenge a friend")
                    .tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            
            Text(gameType.description)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack {
                switch gameType {
                case .single:
                    TextField("Opponent Name", text: $vm.opponentName)
                case .bot:
                    EmptyView()
                case .peer:
                    MPPeersView(startGame: $vm.startGame)
                        .environmentObject(connectionManager)
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            if gameType != .peer {
                Button("Start Game") {
                    game.setUpGame(gameType: gameType, player1Name: yourName, player2Name: vm.opponentName)
                    focus = false
                    vm.startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .bold()
                .disabled(
                    gameType == .undetermined ||
                    gameType == .single && vm.opponentName.isEmpty)
                
                
                Image("App")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                    .padding(.leading, 10)
                
                Spacer()
                Text("Your name is \(yourName)")
                Button("Change my name") {
                    vm.changeName.toggle()
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $vm.startGame) {
            GameView()
                .environmentObject(connectionManager)
        }
        .alert("Change Name", isPresented: $vm.changeName) {
            TextField("New Name", text: $vm.newName)
            Button("OK", role: .destructive) {
                yourName = vm.newName
                exit(-1)
            }
        } message: {
            Text("Tapping on the OK button will quit the application so you can relaunch to use your changed name.")
        }
        .inNavigationStack()
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(yourName: "Sample")
            .environmentObject(GameService())
    }
}
