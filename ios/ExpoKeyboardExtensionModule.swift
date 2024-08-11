import ExpoModulesCore

public class ExpoKeyboardExtensionModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoKeyboardExtension")

    Function("close") { () in
      NotificationCenter.default.post(name: NSNotification.Name("close"), object: nil)
    }

    Function("pasteFromClipboard") { () in
      let clipboard = UIPasteboard.general
        
      if let clipboardValue = clipboard.string {           
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addKey"), object: clipboardValue)
      }
    }

    Function("addText") { (text: String) -> Void in
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addKey"), object: text)
    }
  }
}
