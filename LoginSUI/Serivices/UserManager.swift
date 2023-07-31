//
//  UserManager.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//


// ЗАДАЧА: ОБРАБОТКА ДАННЫХ ПОЛЬЗОВАТЕЛЯ
import Foundation

class UserManager: ObservableObject {
    
    // Отслеживаемое свойство: каждый раз при его изменении все представления,
    // зависящие от этого свойства, будут обновлены
    // Извлекаем данные если таковые есть либо инициализируем "пустым" пользователем
    @Published var user = StorageManager.shared.fetchUser()
    
    func register(userName: String) {
        // Регистрируем пользователя ...
        user.name = userName
        user.isRegistered = true
        // ... и сохраняем данные
        StorageManager.shared.save(user)
    }
    
    func unregisterUser() {
        user.isRegistered = false
        StorageManager.shared.delete(user)
    }
}
