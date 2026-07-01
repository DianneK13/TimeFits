//
//  MeusTreinosView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

import SwiftUI

struct MeusTreinosView: View {
    
    @State private var mostrarCriarTreino = false
    @Environment(\.colorScheme) var colorScheme
    
    @State private var treinos = [
        TreinoItem(titulo: "Superiores", tempo: "Tempo total: 40min"),
        TreinoItem(titulo: "ABS", tempo: "Tempo total: 30min"),
        TreinoItem(titulo: "Inferiores", tempo: "Tempo total: 1h")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                
                LinearGradient(gradient: Gradient(colors: [.green, Color((colorScheme == .light ? .white : .black))]), startPoint: .top, endPoint: .center)
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Meus Treinos")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(treinos) { treino in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(treino.titulo)
                                    .font(.title3)
                                    .foregroundColor((colorScheme == .light ? .black : .black))
                                    .fontWeight(.bold)
                                
                                Text(treino.tempo)
                                    .font(.subheadline)
                                    .foregroundColor(.orange)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color((colorScheme == .light ? .white : .white)))
    
                            .cornerRadius(16)
                            .padding(.horizontal)
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            mostrarCriarTreino = true
                        }) {
                            Label("Adicionar", systemImage: "plus")
                        }
                    }
                    
                }
                
                }
            
            .sheet(isPresented: $mostrarCriarTreino) {
                NovoTreinoView()
            }
        }
    }
}

struct TreinoItem: Identifiable {
    let id = UUID()
    let titulo: String
    let tempo: String
}

#Preview {
    MeusTreinosView()
}
