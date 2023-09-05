//
//  Builds.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

struct Builds: Codable {
    let count: Int
    let href: String
    let build: [Build]
}
