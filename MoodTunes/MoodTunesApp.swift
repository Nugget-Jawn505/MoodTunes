//
//  MoodTunesApp.swift
//  MoodTunes
//
//  Created by Teagan Gordon-Kelley on 11/5/24.
//

import UIKit
import SpotifyiOS

@main
class MoodTunesApp: UIResponder, UIApplicationDelegate {
    let spotifyAuthManager = SpotifyAuthManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        spotifyAuthManager.startAuthorizationFlow()
        return true
    }
}
