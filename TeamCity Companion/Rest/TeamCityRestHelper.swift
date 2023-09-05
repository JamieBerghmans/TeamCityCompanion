//
//  TeamCityRestHelper.swift
//  TeamCity Companion
//
//  Created by Devvix on 27/08/2023.
//

import Foundation

let SharedTeamCityRestHelper = TeamCityRestHelper()

class TeamCityRestHelper {
    let AuthToken = "<AuthToken>"
    let Endpoint = URL(string: "<Endpoint>")!
    
    internal init() {}
    
    func RetrieveBuilds(completionHandler: @escaping @Sendable (Builds?) -> Void) {
        print("Retrieving builds")
        let url = Endpoint.appending(path: "builds")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(AuthToken)", forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) {
          (data, response, error) in

            print("Got data")
            let jsonDecoder = JSONDecoder()
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
            do {
                let result = try jsonDecoder.decode(Builds.self, from: data)
                completionHandler(result)
            } catch {
                print("Unexpected error: \(error).")
                completionHandler(nil)
                return
            }
            
            
        }
        
        dataTask.resume()
    }
}
