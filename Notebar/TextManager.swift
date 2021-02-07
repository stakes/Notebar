//
//  TextManager.swift
//  Notebar
//
//  Created by Jay Stakelon on 2/6/21.
//

import SwiftUI

class TextManager: ObservableObject {
    @Published var text: String {
        didSet {
            UserDefaults.standard.set(text, forKey: "text")
        }
    }
    
    init() {
        var text: String
        if let data = UserDefaults.standard.object(forKey: "text") as? String {
            text = data
        } else {
            text = ""
        }
        self.text = text
    }
}
