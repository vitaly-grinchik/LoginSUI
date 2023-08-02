//
//  StarterView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 22.07.23.
//

/// ПРЕДСТАВЛЕНИЕ ВЫБОРА СЛЕДУЮЩЕГО ПРЕДСТАВЛЕНИЯ (ЭКРАНА) ПО УСЛОВИЮ
import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    // Обращаемся к "сундуку" и берем данные, которыми инициализирован экземпляр
    var body: some View {
        Group {
            if userManager.user.isRegistered {
                MainView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
        // здесь UserManager() - другой экземпляр класса, не из окружения проекта, нужен просто для инициализации превью
    }
}
