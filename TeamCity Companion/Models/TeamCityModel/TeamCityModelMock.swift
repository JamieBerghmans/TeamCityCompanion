//
//  TeamCityBuildsModelMock.swift
//  TeamCity Companion
//
//  Created by Devvix on 28/08/2023.
//

class TeamCityModelMock: TeamCityModelData {
    override init() {
        super.init()
        self.Builds = [
            Build(id: 3, buildTypeId: "BuildTypeId_3", number: "3", status: "SUCCESS", state: .queued, branchName: "testing", defaultBranch: false, href: "SomeRef"),
            Build(id: 2, buildTypeId: "BuildTypeId_2", number: "2", status: "SUCCESS", state: .finished, branchName: "pullrequests/1", defaultBranch: false, href: "SomeRef"),
            Build(id: 1, buildTypeId: "BuildTypeId_1", number: "1", status: "SUCCESS", state: .finished, branchName: "master", defaultBranch: true, href: "SomeRef")
        ]
    }
}
