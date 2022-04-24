import SwiftUI


class AppState: ObservableObject {
    
    @Published var lastWebpageUpdateTime: TimeInterval = NSDate().timeIntervalSince1970
    
    
    func webpageHasBeenUpdated() {
        self.lastWebpageUpdateTime = NSDate().timeIntervalSince1970
    }
    
}
