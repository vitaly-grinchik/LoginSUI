//
//  RegisterView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//

import SwiftUI

// Представление регистрации пользователя
struct RegisterView: View {
    
    @State private var name = ""
    @EnvironmentObject private var user: User
    
    var minNameLength: Int
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
    
                Text(name.count.formatted())
                    .foregroundColor(
                        name.count < minNameLength ? .red : .green
                    )
            }
            .padding([.leading, .trailing], 50 )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(name.count < 3)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(minNameLength: 3)
    }
}
