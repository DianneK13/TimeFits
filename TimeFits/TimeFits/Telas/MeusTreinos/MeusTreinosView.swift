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
        TreinoItem(
            titulo: "Superiores",
            tempo: "Tempo total: 40min",
            exercicios: [
                Exercicio(nome: "Face Pull", series: 3, repeticoes: 12, imagem: "costas"),
                Exercicio(nome: "Remada Baixa", series: 4, repeticoes: 12, imagem: "costas2"),
                Exercicio(nome: "Rosca Martelo", series: 3, repeticoes: 12, imagem: "biceps")
            ]
        ),
        TreinoItem(
            titulo: "ABS",
            tempo: "Tempo total: 30min",
            exercicios: [
                Exercicio(nome: "Prancha", series: 3, repeticoes: 60, imagem: "abdomen"),
                Exercicio(nome: "Abdominal Supra", series: 4, repeticoes: 15, imagem: "abdomen")
            ]
        ),
        TreinoItem(
            titulo: "Inferiores",
            tempo: "Tempo total: 1h",
            exercicios: [
                Exercicio(nome: "Agachamento Livre", series: 4, repeticoes: 10, imagem: "quadriceps"),
                Exercicio(nome: "Leg Press", series: 4, repeticoes: 12, imagem: "quadriceps")
            ]
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                
                LinearGradient(gradient: Gradient(colors: [.green, Color((colorScheme == .light ? .systemGray6 : .black))]), startPoint: .top, endPoint: .center)
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

struct Exercicio: Identifiable {
    let id = UUID()
    let nome: String
    let series: Int
    let repeticoes: Int
    let imagem: String
}

struct TreinoItem: Identifiable {
    let id = UUID()
    let titulo: String
    let tempo: String
    let exercicios: [Exercicio]
}

#Preview {
    MeusTreinosView()
}
