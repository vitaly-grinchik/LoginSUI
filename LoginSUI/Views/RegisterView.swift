//
//  RegisterView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//

/// ПРЕДСТАВЛЕНИЕ РЕГИСТРАЦИИ ПОЛЬЗОВАТЕЛЯ
import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
    
                Text(userManager.user.name.count.formatted())
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
            }
            .padding([.leading, .trailing], 50 )
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func registerUser() {
        userManager.registerUser()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
