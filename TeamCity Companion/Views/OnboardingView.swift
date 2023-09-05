//
//  OnboardingView.swift
//  TeamCity Companion
//
//  Created by Devvix on 29/08/2023.
//

import SwiftUI

struct OnboardingView: View {
    // View
    enum Field: Hashable {
        case teamCityUrl
        case teamCityAuthToken
    }
    
    @Binding public var onBoardingComplete: Bool
    
    @State private var teamCityUrl: String = ""
    @State private var teamCityAuthToken: String = ""
    @State private var validParameters: Bool = false
    
    @FocusState private var focussedTF: Field?
    
    var body: some View {
        ZStack { // Background colour
            Color.accentColor
                .ignoresSafeArea(.all)
            
            content
        }
    }
    
    var content: some View {
        ZStack {
            header
            
            fields
            
            footer
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
    }
    
    var header: some View {
        VStack {
            Text("Connect to TeamCity")
                .tint(.white)
                .font(.title)
                .bold()
            
            Text("Your URL and Auth token are stored confidentially on your device and only transmited to your TeamCity instances.")
                .tint(.white)
                .font(.footnote)
                .fontWeight(.ultraLight)
            
            Spacer()
        }
    }
    
    var fields: some View {
        VStack {
            
            constructOnBoardingTextView(placeholder: "TeamCity URL", text: $teamCityUrl)
                .focused($focussedTF, equals: .teamCityUrl)
                .keyboardType(.URL)
            
            constructOnBoardingTextView(placeholder: "Authentication Token", text: $teamCityAuthToken)
                .focused($focussedTF, equals: .teamCityAuthToken)
                .keyboardType(.default)
            
            Text("Additional servers can be added later in settings")
                .tint(.white)
                .font(.footnote)
                .fontWeight(.ultraLight)
        }
    }
    
    var footer: some View {
        VStack {
            Spacer()
            
            Button {
                signIn()
            } label: {
                Label("Sign In", systemImage: "arrow.up")
                    .frame(maxWidth: .infinity)
                    .padding(Edge.Set.vertical, 24)
                    .background(.white)
                    .foregroundStyle(.accent)
                    .opacity(validParameters ? 1 : 0.6)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
            .padding(Edge.Set.horizontal, 16)
//            .disabled(!validParameters)
        }
    }
}

extension OnboardingView {
    // View Builders
    func constructOnBoardingTextView(placeholder: String, text: Binding<String>) -> some View {
        return TextField(placeholder, text: text)
            .padding(Edge.Set.all, 8)
            .tint(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(.white, style: StrokeStyle(lineWidth: 1.0))
            )
            .onChange(of: text.wrappedValue) {
                formDataChanged()
            }
    }
}


extension OnboardingView {
    // Actions
    func formDataChanged() {
        teamCityUrl=teamCityUrl.lowercased()
        
        var valid = true
        
        // Validate url
        if (teamCityUrl.range(of: "^https?://", options: .regularExpression) == nil) {
            valid = false
        }
        
        // Validate token
        if (teamCityAuthToken.range(of: "^(?:[\\w-]*\\.){2}[\\w-]*$", options: .regularExpression) == nil) {
            valid = false
        }
        
        withAnimation(Animation.spring().speed(3)) {
            validParameters = valid
        }
        
    }
    
    func signIn() {
        // ToDo: Save details to keyvault
        onBoardingComplete = true
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { OnboardingView(onBoardingComplete: $0) }
    }
}
