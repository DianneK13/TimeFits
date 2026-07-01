//
//  TreinoView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

import SwiftUI

struct TreinoView: View {
    let treino: TreinoItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.6, green: 0.9, blue: 0.7).opacity(0.9), .white]),
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    Text(treino.titulo)
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    
                    ForEach(treino.exercicios) { exercicio in
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(exercicio.nome)
                                    .font(.headline)
                                    .bold()
                                
                                Text("\(exercicio.series) séries - \(exercicio.repeticoes) repetições")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "figure.strengthtraining.traditional")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.orange)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .clipShape(Circle())
                        }
                        .padding()
                        .background(Color(.systemGray6).opacity(0.8))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    
                    
                    Color.clear.frame(height: 100)
                }
            }
            
            Button(action: {
                print("Iniciou o treino: \(treino.titulo)")
            }) {
                Image(systemName: "play.fill")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color(red: 0.2, green: 0.75, blue: 0.35))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
            }
            .padding(.bottom, 24)
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
