// (c) 2021 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import SwiftUI

@main
struct HotenkaGUIApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }

  static func getBundleDataPath(_ filenameSansExt: String) -> String {
    Bundle.main.path(forResource: filenameSansExt, ofType: "plist")!
  }

  static let converter = HotenkaChineseConverter(plistDir: getBundleDataPath("convdict"))
}
