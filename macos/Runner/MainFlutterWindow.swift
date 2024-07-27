import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    weak var registrar=flutterViewController.registrar(forPlugin: "my-views")
    let myMacos = MyMacosViewNativeViewFactory(messenger:registrar!.messenger)
    let viewRegistrar = flutterViewController.registrar(forPlugin: "<my-views>")
      viewRegistrar.register(myMacos,withId:"macos")
    super.awakeFromNib()
  }
}
