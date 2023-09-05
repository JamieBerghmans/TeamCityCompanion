//
//  TeamCity_CompanionApp.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

import SwiftUI

@main
struct TeamCity_CompanionApp: App {
    
    @State var onBoardingComplete = false
    
    var body: some Scene {
        WindowGroup {
            if (onBoardingComplete) {
                ContentView()
            } else {
                OnboardingView(onBoardingComplete: $onBoardingComplete)
            }
        }
    }
}
