//
//  ContentView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            SignInView()
                .navigationTitle("Sign In")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
