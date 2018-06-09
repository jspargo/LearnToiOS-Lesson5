//
//  WebViewController.swift
//  LearnToiOS-Lesson5
//
//  Created by Jack Spargo on 09/06/2018.
//  Copyright © 2018 LearnTo iOS. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: String = ""
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        webView.loadHTMLString(url, baseURL: nil)
    }
}
