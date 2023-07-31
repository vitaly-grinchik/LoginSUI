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
    @EnvironmentObject private var userManager: UserManager
    
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
        userManager.registerUser(withName: name)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(minNameLength: 3)
    }
}
