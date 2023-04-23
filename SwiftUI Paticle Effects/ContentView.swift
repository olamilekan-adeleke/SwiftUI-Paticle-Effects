//
//  ContentView.swift
//  SwiftUI Paticle Effects
//
//  Created by Enigma Kod on 23/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Particle Effect")
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
