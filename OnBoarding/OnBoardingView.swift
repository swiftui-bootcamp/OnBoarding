//
//  ContentView.swift
//  OnBoarding
//
//  Created by 王干 on 2024/2/1.
//

import SwiftUI

struct OnBoardingStep: Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(id: 0, image: "1", title: "Cherish Time", description: "On the Blue Planet, every moment is worth our appreciation and gratitude."),
    OnBoardingStep(id: 1, image: "2", title: "The Power of Love", description: "Love with all your heart, even the briefest moments can leave an eternal mark."),
    OnBoardingStep(id: 2, image: "3", title: "Live Without Regrets", description: "Let's not waste any encounter, proving the meaning of life through our actions.")
]

private let count = onBoardingSteps.count

struct OnBoardingView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    @State private var currentStep = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.currentStep = onBoardingSteps.count - 1
                }) {
                    Text("Skip")
                        .padding(16)
                        .foregroundColor(.gray)
                }
            }
            
            TabView(selection: $currentStep) {
                ForEach(onBoardingSteps) { step in
                    VStack {
                        Image(step.image)
                            .resizable()
                            .frame(width: 350, height: 350)
                        
                        Text(step.title)
                            .font(.title)
                            .bold()
                        
                        Text(step.description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.top, 16)
                    }.tag(step.id)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack {
                ForEach(0..<count, id: \.self) { index in
                    if index == currentStep {
                        Rectangle()
                            .frame(width: 16, height: 8)
                            .cornerRadius(10)
                            .foregroundColor(.blue)
                    } else {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom, 16)
            .animation(.spring(duration: 0.1), value: currentStep)
            
            Button(action: {
                if self.currentStep < count - 1 {
                    self.currentStep += 1
                } else {
                    // Get started logic...
                    isOnBoarding = false
                }
            }) {
                Text(currentStep < count - 1 ? "Next" : "Get started")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    OnBoardingView()
}
