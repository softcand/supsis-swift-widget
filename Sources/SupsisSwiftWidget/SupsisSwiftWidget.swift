import UIKit
import WebKit

public class SupsisChatView: UIView {

    private var webView: WKWebView!
    private var domainName: String

    public init(domainName: String) {
        self.domainName = domainName
        super.init(frame: .zero)
        setupWebView()
        loadChat()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true

        webView = WKWebView(frame: bounds, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(webView)
    }

    private func loadChat() {
        let urlString = "https://\(domainName).visitor.supsis.live"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    // Açma ve kapama fonksiyonları
    public func open() {
        self.isHidden = false
    }

    public func close() {
        self.isHidden = true
    }

    // Kullanıcı verisi gönderme
    public func setUserData(_ data: [String: String]) {
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let js = "window.postMessage({command: 'set-user-data', payload: \(jsonString)});"
            webView.evaluateJavaScript(js, completionHandler: nil)
        }
    }

    // Departman belirleme
    public func setDepartment(_ department: String) {
        let js = "window.postMessage({command: 'set-department', payload: '\(department)'});"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}

extension SupsisChatView: WKNavigationDelegate {
    // İsterseniz burada WKNavigationDelegate metodlarını implement edebilirsiniz
}
