//
//  MyMacosViewNativeViewFactory.swift
//  Runner
//
//  Created by Zafer Çetin on 27.07.2024.
//

import WebKit
import Cocoa
import FlutterMacOS


class MyMacosViewNativeViewFactory:NSObject,FlutterPlatformViewFactory {
    private var messenger:FlutterBinaryMessenger
    init(messenger:FlutterBinaryMessenger){
        self.messenger=messenger
        super.init()
    }
    
    func createArgsCodec() -> (any FlutterMessageCodec & NSObjectProtocol)? {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    func create(withViewIdentifier viewId: Int64, arguments args: Any?)->NSView{
        
        if let mainScreen = NSScreen.main {
            
            let screenFrame=mainScreen.frame
            let screenWidth=screenFrame.size.width
            let screenHeight=screenFrame.size.height
            let webView=WKWebView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
            
            if let args = args as? Dictionary<String, Any>,
               let urlValue = args["url"] as? String {
                if let urls = URL(string: urlValue){
                    let request = URLRequest(url: urls)
                    webView.load(request)
                }
            }
            return webView
            
        }else {
            return NSView()
        }
        
    }
}
    
