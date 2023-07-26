//
//  TimeCounter.swift
//  LoginSUI
//
//  Created by Виталий Гринчик on 14.07.23.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    // objectWillChange отправляет "подписчику" обновленный экземпляр типа
    // TimeCounter. Never: здесь ошибки не обрабатываем, точно зная, что их не будет 
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var buttonTitle = "Start"
    var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self, // метод отработки таймера в самом классе определяется
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self) // отправить сообщение подписчику
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate() // Timer stop
        timer = nil // Free memory
    }
    
}
