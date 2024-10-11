import SwiftUI
import SupsisSwiftWidget

struct SupsisChatViewRepresentable: UIViewRepresentable {
    let domainName: String
    let supsisChatView: SupsisChatView

    init(domainName: String) {
        self.domainName = domainName
        self.supsisChatView = SupsisChatView(domainName: domainName)
    }

    func makeUIView(context: Context) -> UIView {
        return supsisChatView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Gerekli güncellemeler
    }
}
