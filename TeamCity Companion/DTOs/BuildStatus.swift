//
//  BuildStatus.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

enum BuildStatus: String, Codable {
    case queued
    case finished
    case running
    case deleted
    case unknown
}
