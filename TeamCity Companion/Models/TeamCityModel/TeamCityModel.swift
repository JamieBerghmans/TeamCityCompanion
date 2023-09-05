//
//  TeamCityModel.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

import Foundation

class TeamCityModel: TeamCityModelData {
    
    override init() {
        super.init()
        
        // ToDo: Replace with trigger (not on init)
        GetBuilds()
    }
    
    func GetBuilds() {
        SharedTeamCityRestHelper.RetrieveBuilds { builds in
            DispatchQueue.main.sync {
                if let builds = builds {
                    self.Builds = builds.build
                }
            }
        }
    }
}


