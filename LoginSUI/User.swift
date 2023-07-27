//
//  User.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//

import Foundation

class User: ObservableObject {
    // Отслеживаемое свойство: каждый раз при его изменении все представления,
    // зависящие от этого свойства, будут обновлены
    @Published var isRegistered = UserDefaults.standard.bool(forKey: "userIsRegistered")
    // Извлекаем ранее введённое имя уже зарегестрированного юзера
    var name = UserDefaults.standard.string(forKey: "userName") ?? ""
    
    func login(user userName: String) {
        name = userName
        isRegistered = true
        // Сохраняем текущее состояние (данные) приложения
        UserDefaults.standard.set(true, forKey: "userIsRegistered")
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    func logout() {
        isRegistered = false
        UserDefaults.standard.set(false, forKey: "userIsRegistered")
        UserDefaults.standard.removeObject(forKey: "userName")
    }
}
