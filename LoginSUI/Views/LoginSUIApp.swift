//
//  LoginSUIApp.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 14.07.23.
//

import SwiftUI

@main
struct LoginSUIApp: App {
    // Первоначальная инициализация
    // Кладём объект - экземпляр класса - в окружение, этакий "сундук" среды (окружения)
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
            // здесь уже передаётся реальный объект нашего окружения
        }
    }
}
