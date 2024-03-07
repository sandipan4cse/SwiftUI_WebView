
import SwiftUI

struct ContentView: View {
    @State var showWebView = false
    @State var showExternalBrowser = false
    private let urlString: String = "https://www.apple.com/"
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack {
                    NavigationLink(destination: WebView(urlString: urlString), isActive: $showWebView) {
                        //                        Text("Open Web View")
                        Button {
                            showWebView = true
                        } label: {
                            Text("Open Webview")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .frame(width: 150, height: 30)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .background(RoundedRectangle(
                                    cornerRadius: 10,
                                    style: .continuous
                                )
                                    .fill(Color.gray)
                                )
                        }
                    }.padding()
                        Button {
                            showExternalBrowser = true
                            UIApplication.shared.open(URL(string: urlString)!)
                                } label: {
                                    Text("Open external browser")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(width: 220, height: 30)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 1)
                                        )
                                        .background(RoundedRectangle(
                                            cornerRadius: 10,
                                            style: .continuous
                                        )
                                            .fill(Color.gray)
                                        )
                                }
                }
                }
                .navigationBarTitle("SwiftUI Webview", displayMode: .inline)
                .ignoresSafeArea(.all)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

