//
//  OnBoardingApp.swift
//  OnBoarding
//
//  Created by 王干 on 2024/2/1.
//

import SwiftUI

@main
struct OnBoardingApp: App {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnBoarding {
                OnBoardingView()
            } else {
                ContentView()
            }
        }
    }
}
