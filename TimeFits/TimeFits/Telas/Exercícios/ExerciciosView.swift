//
//  ExerciciosView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

import SwiftUI


struct ExerciciosView: View {
    var body: some View {
        
        ListaDeExercicios()
            .navigationTitle("Exercícios")
            // IDEA PARA A CRIAÇÃO DE EXERCÍCIOS DO USER
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink {
                        NovoExercicioView()
                    } label: {
                        Label("Novo Exercício", systemImage: "plus")
                            .foregroundStyle(.black)
                    }
                }
            }
    }
}


// Refact: perguntar para Mentor se era bom
// separar essa subview em um outro arquivo

struct ListaDeExercicios: View {
    @Environment(\.colorScheme) var colorScheme
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green, Color((colorScheme == .light ? .systemGray6 : .black))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(data.enumerated(), id: \.offset) { index, exercicio in
                            NavigationLink {
                                ExercicioView(
                                    nome: data[index].nome,
                                    imagem: data[index].imagem,
                                    tempoRep: data[index].velocidadeDeRepSecs,
                                    tempoRest: data[index].tempoDeDescansoSecs
                                )
                            } label: {
                                ZStack {
                                    
                                    Image("\(data[index].imagem)")
                                        .resizable()
                                        .frame(alignment: .leading)
                                        .clipShape(.rect(cornerRadius: 8))
                                    
                                    
                                    VStack {
                                        Spacer()
                                        Text("\(data[index].nome)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(Color((colorScheme == .light ? .black : .black)))
                                            .font(.title3).bold()
                                            .padding(20)
                                        
                                    }
                                }
                                .frame(width: 357, height: 110)
                                .background {
                                    Color(.white)
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .padding(5)
                                
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciciosView()
}
