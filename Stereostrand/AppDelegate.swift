import SwiftUI
import OneSignal
import Reachability


class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let reachability = try! Reachability()
    
    var appState = AppState()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.initApplication(launchOptions)
        
        return true
    }
    
    private func initApplication(_ launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) {
        if reachability.connection == .unavailable {
            self.networkConnectionNotAvailable(launchOptions)
        } else {
            self.initApplicationWithNetworkConnection(launchOptions)
        }
    }
    
    private func networkConnectionNotAvailable(_ launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) {
        reachability.whenReachable = { reachability in
            print("Network is now reachable")
            
            self.reachability.stopNotifier()
            
            self.initApplicationWithNetworkConnection(launchOptions)
            
            self.appState.webpageHasBeenUpdated()
        }
        
        try? self.reachability.startNotifier()
    }
    
    private func initApplicationWithNetworkConnection(_ launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) {
        self.registerForPushNotifications(launchOptions)
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("Registering for remote notification worked, Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register for remote notification: \(error)")
    }
    
    
    
    func registerForPushNotifications(_ launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
       // Remove this method to stop OneSignal Debugging
//       OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        
       OneSignal.initWithLaunchOptions(launchOptions)
       OneSignal.setAppId("838a7c86-0f57-4a53-baa2-6c37f16d3a67")
        
       OneSignal.promptForPushNotifications(userResponse: { accepted in
         print("User accepted notification: \(accepted)")
       })
    }
    
}
