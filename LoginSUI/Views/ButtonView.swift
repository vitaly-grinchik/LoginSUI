//
//  ButtonView.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 27.07.23.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    @EnvironmentObject var user: UserManager
    
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
        }
        .frame(width: 200, height: 60)
        .background(backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(timer: TimeCounter(),
                   title: "Logout",
                   foregroundColor: .white,
                   backgroundColor: .blue,
                   action: {}
        )
    }
}
