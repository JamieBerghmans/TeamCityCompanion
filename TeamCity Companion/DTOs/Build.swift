//
//  Build.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

struct Build: Codable, Identifiable {
    let id: Int64
    let buildTypeId: String
    let number: String
    let status: String
    let state: BuildStatus
    let branchName: String?
    let defaultBranch: Bool?
    let href: String
}
