//
//  ContentView.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var TeamCityBuildsModelData: TeamCityModelData = TeamCityModel()
    
    var body: some View {
        TabView {
            BuildsView(TeamCityBuildsModelData: TeamCityBuildsModelData)
                .tabItem {
                    Label("Builds", systemImage: "bolt")
                }
            ProjectsView()
                .tabItem{
                    Label("Projects", systemImage: "list.bullet.rectangle")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView(TeamCityBuildsModelData: TeamCityModelMock())
}
