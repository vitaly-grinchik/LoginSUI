//
//  UserManager.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//

/// ЗАДАЧА:  ОБРАБОТКА ДАННЫХ ПОЛЬЗОВАТЕЛЯ
import Foundation

class UserManager: ObservableObject {
    
    // Отслеживаемое свойство: каждый раз при его изменении все представления,
    // зависящие от этого свойства, будут обновлены
    // Извлекаем данные если таковые есть либо инициализируем "пустым" пользователем
    @Published var user = StorageManager.shared.fetchUser()
    
    private let minNameLength = 3
    
    var nameIsValid: Bool {
        user.name.count >= minNameLength
    }
    
    func registerUser() {
        // Регистрируем пользователя ...
        user.isRegistered = true
        // ... и сохраняем данные
        StorageManager.shared.save(user)
    }
    
    func unregisterUser() {
        user = User() // "Reset" user data	
        StorageManager.shared.delete(user)
    }
}
