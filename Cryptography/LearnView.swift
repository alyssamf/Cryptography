//
//  LearnView.swift
//  Cryptography
//
//  Created by Alyssa Feagans on 2/26/23.
//

// TODO: Implement partial search function. Will list dropdown of partial matches, then user can click and it will go to that cipher's main view page.
// TODO: Put each cipher name in a list on main page and randomly choose a cipher when user selects random button

import SwiftUI

struct LearnView: View {
    @State var searchValue: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Learn")
                    .padding()
                    .font(.title)
                HStack {
                    TextField(
                        "Search ciphers ...",
                        text: $searchValue
                    )
                    .foregroundColor(.blue)
                    .lineLimit(1)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.primary)
                    .padding()
                    .padding()
                }
                
                Button("Surprise Me") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Spacer()
                Spacer()
                List {
                    NavigationLink(destination: AffineMainView(), label: {
                        Text("Affine Cipher")
                            .hoverEffect(.highlight)
                    })
                    NavigationLink(destination: AffineMainView(), label: {
                        Text("Enigma Cipher")
                    })
                    NavigationLink(destination: AffineMainView(), label: {
                        Text("Hill Cipher")
                    })
                    NavigationLink(destination: AffineMainView(), label: {
                        Text("Vigenère Cipher")
                    })
                }
            }
            .padding()
            .background(Color("backgroundColor"))
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
