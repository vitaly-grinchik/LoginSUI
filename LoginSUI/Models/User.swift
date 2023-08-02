//
//  User.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 28.07.23.
//

/// МОДЕЛЬ
struct User: Codable {
    var name: String
    var isRegistered: Bool
    
    init() {
        self.name = ""
        self.isRegistered = false
    }
    
}
