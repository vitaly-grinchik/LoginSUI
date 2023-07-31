//
//  User.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 28.07.23.
//

// Модель
struct User: Codable {
    var name: String
    var isRegistered: Bool
    
    init() {
        self.name = ""
        self.isRegistered = false
    }
    
}
