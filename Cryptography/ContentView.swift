//
//  ContentView.swift
//  Cryptography
//
//  Created by Alyssa Feagans on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchValue: String = ""
    var body: some View {
        TabView {
            LearnView()
                .tabItem() {
                    Image(systemName: "brain.head.profile")
                    Text("Learn")
                }
            EncryptDecryptView()
                .tabItem() {
                    Image(systemName: "touchid")
                    Text("Encrypt & Decrypt")
                }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
