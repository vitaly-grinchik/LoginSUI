//
//  User.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 20.07.23.
//

import Foundation

class User: ObservableObject {
    // Отслеживаемое свойстсво: каждый раз при его изменении все представления
    // (экземпляры струтур :View), зависящие от этого свойства, будут обновлены
    @Published var isRegistered = false
    
    var name = ""
}
