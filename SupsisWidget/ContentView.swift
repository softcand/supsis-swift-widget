import SwiftUI

struct ContentView: View {
    @State private var showChat = true // Başlangıçta chat açık
    let supsisChatView = SupsisChatViewRepresentable(domainName: "butikponcik")
    
    var body: some View {
        ZStack {
            // Arka plan rengi
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            // Chat widget'ı
            if showChat {
                supsisChatView
                    .edgesIgnoringSafeArea(.all)
            }
            
            // Sol orta konumda ikon butonu
            GeometryReader { geometry in
                Button(action: {
                    self.showChat.toggle()
                }) {
                    Image(systemName: showChat ? "xmark.circle.fill" : "message.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
                .position(x: 40, y: geometry.size.height / 2)
            }
        }
    }
}
