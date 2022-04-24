import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        WebView()
            // a simple hack to update web page if network connection changes
            .id(self.appState.lastWebpageUpdateTime)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
