//
//  StorageManager.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 28.07.23.
//

// ЗАДАЧА: хранение данных в UserDefaults
import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    
    private let userDataKey = "userData"
    
    private init() {}
    
    func save(_ user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        defaults.set(userData, forKey: userDataKey)
    }
    
    func delete(_ user: User) {
        defaults.removeObject(forKey: userDataKey)
    }
    
    func fetchUser() -> User {
        guard let data = defaults.data(forKey: userDataKey) else {
            return User()
        }
        
        guard let user = try? JSONDecoder().decode(User.self, from: data) else {
            return User()
        }
        return user
    }
    
}
