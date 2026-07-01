//
//  MeusTreinosView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

import SwiftUI

struct MeusTreinosView: View {
    
    @State private var mostrarCriarTreino = false
    
    @State private var treinos = [
        TreinoItem(
            titulo: "Superiores",
            tempo: "Tempo total: 40min",
            exercicios: [
                Exercicio(nome: "Face Pull", series: 3, repeticoes: 12, imagem: "costas"),
                Exercicio(nome: "Remada Baixa", series: 4, repeticoes: 12, imagem: "costas"),
                Exercicio(nome: "Rosca Martelo", series: 3, repeticoes: 12, imagem: "biceps")
            ]
        ),
        TreinoItem(
            titulo: "ABS",
            tempo: "Tempo total: 30min",
            exercicios: [
                Exercicio(nome: "Prancha", series: 3, repeticoes: 60, imagem: "abs"),
                Exercicio(nome: "Abdominal Supra", series: 4, repeticoes: 15, imagem: "abs")
            ]
        ),
        TreinoItem(
            titulo: "Inferiores",
            tempo: "Tempo total: 1h",
            exercicios: [
                Exercicio(nome: "Agachamento Livre", series: 4, repeticoes: 10, imagem: "pernas"),
                Exercicio(nome: "Leg Press", series: 4, repeticoes: 12, imagem: "pernas")
            ]
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.6, green: 0.9, blue: 0.7).opacity(0.9), .white]),
                    startPoint: .top,
                    endPoint: .center
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Meus Treinos")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.top, 50)
                        
                        ForEach(treinos) { treino in
                            NavigationLink(destination: TreinoView(treino: treino)) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(treino.titulo)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Text(treino.tempo)
                                        .font(.subheadline)
                                        .foregroundColor(.orange)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemGray6).opacity(0.7))
                                .cornerRadius(16)
                                .padding(.horizontal)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                    
                
                
                Button(action: {
                    
                    mostrarCriarTreino = true
                }) {
                    Image(systemName: "plus")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
                }
                .padding(.trailing, 20)
                .padding(.top, 10)
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
