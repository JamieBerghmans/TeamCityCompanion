//
//  TeamCityBuildsModelProtocol.swift
//  TeamCity Companion
//
//  Created by Devvix on 28/08/2023.
//

import Foundation

class TeamCityModelData: ObservableObject {
    @Published var Builds: [Build]?
}
