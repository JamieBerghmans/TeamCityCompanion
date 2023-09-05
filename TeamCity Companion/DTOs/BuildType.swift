//
//  BuildType.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

struct BuildType {
    let id: String
    let internalId: String
    let name: String
    let templateFlag: Bool
    let type: BuildTypeType
    let paused: Bool
    let uuid: String
    let description: String
    let projectName: String
    let projectId: String
    let projectInternalId: String
    let href: String
    let webUrl: String
    let inherited: Bool
    let links: [Links]
}
