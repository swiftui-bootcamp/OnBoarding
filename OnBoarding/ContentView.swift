//
//  ContentView.swift
//  OnBoarding
//
//  Created by 王干 on 2024/2/7.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool?
    
    var body: some View {
        Button(action: {
            isOnBoarding = true
        }, label: {
            Text("Return to OnBoarding view")
                .padding()
                .padding(.horizontal)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(10)
        })
    }
}

#Preview {
    ContentView()
}
