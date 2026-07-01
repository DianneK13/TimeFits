//
//  ExercicioView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//
//  Versão Inicial, mas funciona

import SwiftUI

struct ExercicioView: View {
    
    let nome: String
    let imagem: String
    let tempoRep: Int
    let tempoRest: Int
    
    var body: some View {
        
        ScrollView {
            VStack{
                // Imagem
                Image(imagem)
                    .resizable()
                    .frame(width: 356, height: 187)
                    .cornerRadius(20)
                        
                // Visão geral
                VStack(alignment: .leading, spacing: 10){
                    Text("Visão Geral").bold().font(.title3)
                    
                    Text("Velocidade de repetição: \(tempoRep)s")
                    Text("Tempos de descanso: \(tempoRest)s")
                }
                .safeAreaPadding(23)
            }
        }

        .scrollEdgeEffectStyle(.automatic, for: .bottom)
        .navigationTitle(nome)
        .toolbarVisibility(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ExercicioView(nome: "nome", imagem: "classicPushUP", tempoRep: 10, tempoRest: 10)
}
