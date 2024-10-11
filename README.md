# Supsis Swift Widget

**Supsis Swift Widget**, iOS uygulamalarınız için gömülebilir bir sohbet widget'ı sağlayan bir Swift paketidir. Bu widget, kullanıcılarınızın destek ekibinizle gerçek zamanlı iletişim kurmasını sağlar.

## Özellikler

- **Kolay Entegrasyon**: Uygulamanıza minimum çabayla sohbet bileşeni ekleyin.
- **Özelleştirilebilir**: Kullanıcı verilerini ve departmanı ayarlayarak kişiselleştirilmiş destek sunun.
- **Duyarlı Arayüz**: Bileşen, farklı ekran boyutlarına ve yönlendirmelerine sorunsuz bir şekilde uyum sağlar.
- **Gerçek Zamanlı İletişim**: Kullanıcılarınız ve destek ekibiniz arasında anlık mesajlaşma imkanı sağlar.

## Gereklilikler

- **iOS 12.0** veya üzeri
- **Swift 5.3**: veya üzeri

## Kurulum

Bu kütüphane Swift Package Manager aracılığıyla dağıtılmaktadır. Xcode projenize eklemek için aşağıdaki adımları izleyin:

- Xcode'da projenizi açın.

- ```File > Swift Packages > Add Package Dependency``` menüsüne gidin.

- Depo URL'sini girin:
  
```ardunio
https://github.com/kullaniciadi/SupsisSwiftWidget.git
```

- Kullanmak istediğiniz sürümü seçin.
- Kurulumu tamamlayın.

## Kullanım

- Paketi İçe Aktarın
  
**SupsisSwiftWidget**'ı kullanmak istediğiniz dosyalarda aşağıdaki ifadeyi ekleyin:

```import SupsisSwiftWidget```

- SupsisChatView'i Başlatma ve Kullanma

**SwiftUI Örneği**

```swift
import SwiftUI

import SupsisSwiftWidget

struct ContentView: View {
@State private var showChat = true

let supsisChatView = SupsisChatViewRepresentable(domainName: "sizin_domain_adiniz")

var body: some View {

    ZStack {

        if showChat {

            supsisChatView

                .edgesIgnoringSafeArea(.all)

        }

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
```

**UIKit Örneği**

```swift
import UIKit

import SupsisSwiftWidget

class ViewController: UIViewController {
var supsisChatView: SupsisChatView!

override func viewDidLoad() {

    super.viewDidLoad()

    // SupsisChatView'i Başlatma

    supsisChatView = SupsisChatView(domainName: "sizin_domain_adiniz")

    supsisChatView.frame = view.bounds

    supsisChatView.isHidden = true // Başlangıçta gizli

    view.addSubview(supsisChatView)

    // "Sohbeti Aç" Butonu Ekleme

    let openChatButton = UIButton(type: .system)

    openChatButton.setTitle("Sohbeti Aç", for: .normal)

    openChatButton.frame = CGRect(x: 50, y: 100, width: 150, height: 50)

    openChatButton.addTarget(self, action: #selector(openChat), for: .touchUpInside)

    view.addSubview(openChatButton)

    // "Sohbeti Kapat" Butonu Ekleme

    let closeChatButton = UIButton(type: .system)

    closeChatButton.setTitle("Sohbeti Kapat", for: .normal)

    closeChatButton.frame = CGRect(x: 50, y: 160, width: 150, height: 50)

    closeChatButton.addTarget(self, action: #selector(closeChat), for: .touchUpInside)

    view.addSubview(closeChatButton)

}

@objc func openChat() {

    supsisChatView.open()

    supsisChatView.isHidden = false

}

@objc func closeChat() {

    supsisChatView.close()

    supsisChatView.isHidden = true

}

func setUserData() {

    supsisChatView.setUserData(["email": "kullanici@ornek.com", "name": "Ahmet Yılmaz"])

}

func set
```

## Fonksiyonların Açıklaması

| Fonksiyon | Açıklama    | Kullanım Örneği    |
| :-----: | :---: | :---: |
| ```initialize(domainName: String)``` | Bileşeni domain adınızla başlatır.   | ```supsisChatView?.initialize("sizin_domain_adiniz")```   |
| ```setUserData(userData: Map<String, String>)``` | Sohbet oturumu için kullanıcı bilgilerini ayarlar.   | ```supsisChatView?.setUserData(mapOf("email" to "kullanici@ornek.com", "name" to "Ahmet Yılmaz"))```   |
| ```setDepartment(department: String)``` | Sohbet oturumu için departmanı ayarlar.   | ```supsisChatView?.setDepartment("Destek")```   |
| ```open()``` | Sohbet bileşenini açar ve kullanıcıya gösterir.   | ```supsisChatView?.open()```   |
| ```close()``` | Sohbet bileşenini kapatır ve kullanıcıdan gizler.   | ```supsisChatView?.close()```   |

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.

## Destek
Herhangi bir sorunla karşılaşırsanız veya sorunuz varsa, lütfen GitHub deposu üzerinden bir sorun (issue) açın.
