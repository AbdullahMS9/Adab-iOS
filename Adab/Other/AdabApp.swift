//
//  AdabApp.swift
//  Adab
//
//  Created by Abdullah Saad on 2/18/24.
//

import SwiftUI
import FirebaseCore
/*import SwiftUI



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}*/

@main
struct AdabApp: App {
    init(){
        FirebaseApp.configure()
    }
    // register app delegate for Firebase setup
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
