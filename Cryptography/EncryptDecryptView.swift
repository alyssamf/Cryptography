//
//  EncryptDecryptView.swift
//  Cryptography
//
//  Created by Alyssa Feagans on 2/26/23.
//

import SwiftUI

struct EncryptDecryptView: View {
    @State var cipher: String = ""
    @State var textEditorText: String = "Type text to encrypt or decrypt here ..."
    @State var inputText: String = ""
    @State var outputText: String = ""
    @State var isEncrypt: Bool = true
    @State var showCipherSettings: Bool = false
    @State var selected = 1
    
    @State var affineACoefficient: Int = 1
    @State var affineBCoefficient: Int = 0
    @State var affineLanguageLength: Int = 26 // English
    @State var validAffineACoefficient = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25]
    
    
    var body: some View {
        VStack {
            Text("Encrypt & Decrypt")
                .padding()
                .font(.title)
            HStack {
                Menu((cipher == "") ? "Choose Cipher" : cipher) {
                    Button("Affine Cipher") {
                        cipher = "Affine Cipher"
                    }
                    Button("Enigma Cipher") {
                        cipher = "Enigma Cipher"
                    }
                    Button("Hill Cipher") {
                        cipher = "Hill Cipher"
                    }
                    Button("Vigenère Cipher") {
                        cipher = "Vigenère Cipher"
                    }
                }
                Spacer()
                // Based on current cipher - choose required settings
                Button("Cipher Settings") {
                    showCipherSettings.toggle()
                }
                .disabled(cipher=="")
                .popover(isPresented: $showCipherSettings, arrowEdge: .bottom) {
                    VStack {
                        Text(cipher + " Settings")
                            .font(.title)
                            .padding()
                        // Put a help button here that routes to learn
                        Text("Keys = (a, b)  L = language size")
                        Spacer()
                        HStack {
                            Text("a coefficient:")
                            Picker(selection: $affineACoefficient, label: Text("")) {
                                ForEach(validAffineACoefficient, id: \.self) { item in
                                    Text("\(item)")
                                }
                            }
                        }
                        .frame(width: 300)
                        
                        HStack {
                            Text("b coefficient:   \(affineBCoefficient)")
                            Stepper(value: $affineBCoefficient, in: 0...affineLanguageLength-1) {}
                        }
                        .frame(width: 300)
                        
                        HStack {
                            Text("L:   \(affineLanguageLength)")
                                .onChange(of: affineLanguageLength) { newValue in
                                    // Update validAffineACoefficient list when updating language size
                                    updateValidAffineACoefficient()
                                }
                            Stepper(value: $affineLanguageLength, in: 0...100) {}
                        }
                        .frame(width: 300)
                        
                        Spacer()
                    }
                }
            }
            Spacer()
            HStack {
                Text((selected == 1) ? "Plaintext:" : "Ciphertext:")
                Spacer()
                Spacer()
            }
            TextEditor(text: $textEditorText)
                .onChange(of: textEditorText) { newValue in
                    if (cipher != "") {
                        (selected == 1) ? encrypt() : decrypt()
                    }
                }
                .frame(height: 150)
                .autocorrectionDisabled()
            
            HStack {
                Spacer()
                Picker(selection: $selected, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Encrypt").tag(1)
                    Text("Decrypt").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
                
                Spacer()
            }
            HStack {
                Text((selected == 1) ? "Ciphertext:" : "Plaintext:")
                Spacer()
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("DJKFANSDKFNASKDFJNASKD LKDFJAKLF")
                    Spacer()
                    Spacer()
                }
            }
            .frame(height: 150)
            .background()
            
            Spacer()
            Spacer()
        }
        .padding()
        .background(Color("backgroundColor"))
    }
    
    func updateValidAffineACoefficient() {
        print("updateValidAffineACoefficient")
        // Find all values of a (0 to L) that makes this statement true gcd(a, L)=1
        validAffineACoefficient = []
        // always true = gcd(1, L)=1
        validAffineACoefficient.append(1)
        
        for i in stride(from: 2, to: affineLanguageLength, by: 1) {
            print(i)
            // If L is even, a cannot also be even. Skip these values.
            if (affineLanguageLength % 2 == 0) && (i % 2 == 0) {
                continue
            }
            
            if gcd(i, affineLanguageLength) == 1 {
                validAffineACoefficient.append(i)
            }
        }
    }
}

struct EncryptDecryptView_Previews: PreviewProvider {
    static var previews: some View {
        EncryptDecryptView()
    }
}

func gcd(_ m: Int, _ n: Int) -> Int {
    var a: Int = 0
    var b: Int = max(m, n)
    var r: Int = min(m, n)

    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

func encrypt() {
    print("Encrypting")
}

func decrypt() {
    print("decrypting")
}
