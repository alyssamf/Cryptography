//
//  AffineMainView.swift
//  Cryptography
//
//  Created by Alyssa Feagans on 2/25/23.
//

import SwiftUI

struct AffineMainView: View {
    var body: some View {
        VStack {
            Text("Affine Cipher")
                .padding()
                .font(.title)
            HStack {
                Text("Monoalphabetic substitution cipher using mathematical linear function f=Ax+B.")
                    .font(.subheadline)
                    .padding()
            }
        
            Spacer()
            
            GroupBox() {
                List {
                    NavigationLink(destination: AffineLearnView(), label: {
                        Text("Learn")
                            .hoverEffect(.highlight)
                    })
                    NavigationLink(destination: AffinePracticeView(), label: {
                        Text("Practice")
                    })
                }
            }
        }
    }
}

struct AffineMainView_Previews: PreviewProvider {
    static var previews: some View {
        AffineMainView()
    }
}
