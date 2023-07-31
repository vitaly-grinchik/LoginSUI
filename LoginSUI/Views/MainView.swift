//
//  ContentView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 14.07.23.
//

import SwiftUI

// Основное представление (после регистрации)
struct MainView: View {

    @StateObject private var timer = TimeCounter() // Состояние объекта
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            VStack(spacing: 50) {
                Text("Hi, \(userManager.user.name)")
                Text(timer.counter.formatted())
            }
                .font(.largeTitle)
                .padding(.top, 100)
    
            Spacer()
            
            ButtonView(
                timer: timer,
                title: timer.buttonTitle,
                foregroundColor: .white,
                backgroundColor: .red,
                action: timer.startTimer
            )
            
            Spacer()
            
            ButtonView(timer: timer,
                       title: "Logout",
                       foregroundColor: .white,
                       backgroundColor: .blue,
                       action: logout
            )
        }
    }
    
    private func logout() {
        timer.killTimer()
        userManager.unregisterUser()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserManager())
    }
}
