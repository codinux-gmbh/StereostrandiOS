import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    let url = "https://www.stereostrand.de/"
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        webView.navigationDelegate = context.coordinator
        
        webView.load(URLRequest(url: URL(string: self.url)!))
        
        return webView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var parent: WebView
        
        init(_ uiWebView: WebView) {
            self.parent = uiWebView
        }
        
    }

}


struct WebView_Previews: PreviewProvider {

    static var previews: some View {
        WebView()
    }

}
