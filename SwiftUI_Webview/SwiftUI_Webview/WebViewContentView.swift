import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
    let urlString: String

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            webView.navigationDelegate = context.coordinator
            if let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
            return webView
        }

        func updateUIView(_ uiView: WKWebView, context: Context) {
            // Update the web view if needed
        }

        class Coordinator: NSObject, WKNavigationDelegate {
            // Implement delegate methods here
            let parent: WebView
            
            init(_ parent: WebView) {
                        self.parent = parent
                    }

                    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
                        if let host = navigationAction.request.url?.host {
                            if (host != "www.apple.com") && (navigationAction.navigationType == .linkActivated) {
                                UIApplication.shared.open(navigationAction.request.url!)
                                decisionHandler(.cancel)
                                return
                            }
                        }
                        decisionHandler(.allow)
                    }
        }
}

