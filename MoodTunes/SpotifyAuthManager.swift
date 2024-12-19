//
//  SpotifyAuthManager.swift
//  MoodTunes
//
//  Created by Teagan Gordon-Kelley on 12/12/24.
//

import Foundation
import SpotifyiOS

class SpotifyAuthManager: NSObject, SPTSessionManagerDelegate {
    private let sessionManager: SPTSessionManager

    override init() {
        let SpotifyClientID = "2bc0353826364cdabba2197835fc6ab8" // Replace with your Client ID
        let SpotifyRedirectURI = URL(string: "moodtunes://auth/callback")! // Replace with your Redirect URI

        let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURI)
        self.sessionManager = SPTSessionManager(configuration: configuration, delegate: nil)
        super.init()
        self.sessionManager.delegate = self
    }

    func startAuthorizationFlow() {
        if sessionManager.session == nil {
            sessionManager.initiateSession(with: [.appRemoteControl, .userReadEmail], options: .default, campaign: nil)
        }
    }

    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        print("Access Token: \(session.accessToken)")
    }

    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        print("Failed to authenticate: \(error)")
    }
}
