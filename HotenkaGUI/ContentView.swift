// (c) 2021 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import SwiftUI

struct ContentView: View {
  @State var contentCHS: String = ""
  @State var contentCHT: String = ""
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Simplified Chinese")
        TextEditor(text: $contentCHS).onChange(of: contentCHS) { value in
          contentCHT = HotenkaGUIApp.converter.convert(value, to: .zhHantTW)
        }
        .font(.system(size: 14))
      }
      VStack(alignment: .leading) {
        Text("Traditional Chinese")
        TextEditor(text: $contentCHT).onChange(of: contentCHT) { value in
          contentCHS = HotenkaGUIApp.converter.convert(value, to: .zhHansCN)
        }
        .font(.system(size: 14))
      }
    }
    .frame(minWidth: 640, minHeight: 480)
    .padding()
    .background(VisualEffectView(material: .sidebar, blendingMode: .behindWindow))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// MARK: - Windows Aero in Swift UI

// Ref: https://stackoverflow.com/questions/62461957

@available(macOS 10.15, *)
struct VisualEffectView: NSViewRepresentable {
  let material: NSVisualEffectView.Material
  let blendingMode: NSVisualEffectView.BlendingMode

  func makeNSView(context _: Context) -> NSVisualEffectView {
    let visualEffectView = NSVisualEffectView()
    visualEffectView.material = material
    visualEffectView.blendingMode = blendingMode
    visualEffectView.state = NSVisualEffectView.State.active
    return visualEffectView
  }

  func updateNSView(_ visualEffectView: NSVisualEffectView, context _: Context) {
    visualEffectView.material = material
    visualEffectView.blendingMode = blendingMode
  }
}
