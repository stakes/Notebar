//
//  ContentView.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    private var placeholder: String = "writesomething"
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .font(Font.system(.body, design: .monospaced))
                    .padding(.leading, -5)
                if (text == "") {
                    Text(placeholder)
                        .font(Font.system(.body, design: .monospaced))
                        .foregroundColor(Color.gray)
                }
            }.padding(12)
        }.background(Color.white)
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


