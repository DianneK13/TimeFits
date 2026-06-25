//
//  ContentView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 19/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Meus Treinos", systemImage: "heart.fill") {
                MeusTreinosView()
            }
            
            Tab("Exercícios", systemImage: "dumbbell.fill"){
                ExerciciosView()
            }
        }
    }
}

#Preview {
    ContentView()
}
