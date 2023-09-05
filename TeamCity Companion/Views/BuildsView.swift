//
//  AllBuildsView.swift
//  TeamCity Companion
//
//  Created by Devvix on 28/08/2023.
//

import SwiftUI

struct BuildsView: View {
    
    @ObservedObject var TeamCityBuildsModelData: TeamCityModelData
    
    var body: some View {
        NavigationStack {
            List {
                if let builds = TeamCityBuildsModelData.Builds {
                    ForEach(builds) { build in
                        NavigationLink {
                            SettingsView()
                        } label: {
                            BuildCell(build: build)
                        }
                        
                    }
                }
            }
            .navigationTitle("Builds")
        }
    }
}

struct BuildCell: View {
    
    @State var build: Build
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Id:")
                        .bold()
                    Text("\(build.id)")
                }
                HStack {
                    Text("BuildTypeId:")
                        .bold()
                    Text("\(build.buildTypeId)")
                }
                HStack {
                    Text("Branch:")
                        .bold()
                    Text("\(build.branchName ?? "Not found")")
                }
                
            }
            
            Spacer()
            
            if build.state == .finished {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .imageScale(.large)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    BuildsView(TeamCityBuildsModelData: TeamCityModelMock())
}
