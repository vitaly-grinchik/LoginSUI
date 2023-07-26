//
//  StarterView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 22.07.23.
//

import SwiftUI

// Представление выбора следующего представления (экрана) по условию
struct StarterView: View {
    @EnvironmentObject private var user: User
    // Обращаемся к "сундуку" и берем данные, которыми инициализирован экземпляр
    
    var body: some View {
        Group {
            if user.isRegistered {
                ContentView()
            } else {
                RegisterView(minNameLength: 3)
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(User())
        // здесь UserManager() - другой экземпляр класса, не из окружения проекта, нужен просто для инициализации превью
    }
}
