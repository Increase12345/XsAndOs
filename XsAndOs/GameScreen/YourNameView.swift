//
//  YourNameView.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/4/23.
//

import SwiftUI

struct YourNameView: View {
    @AppStorage("yourName") var yourName = ""
    @State private var userName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("This is the name that will be associated with this device.")
                .multilineTextAlignment(.center)
            TextField("Your Name", text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("Set") {
                yourName = userName
            }
            .buttonStyle(.borderedProminent)
            .bold()
            .disabled(userName.isEmpty)
            
            Image("App")
                .resizable()
                .scaledToFit()
                .frame(width: 256, height: 256)
            Spacer()
        }
        .padding()
    }
}

struct YourNameView_Previews: PreviewProvider {
    static var previews: some View {
        YourNameView()
    }
}
