//
//  NovoTreinoView.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

import SwiftUI
import PhotosUI

struct NovoTreinoView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var nomeDoTreino = "ABS"
    
    @State private var imagemSelecionada: PhotosPickerItem? = nil
    @State private var imagemDeFundo: Image? = nil
    
    @State private var exercicios = [
        ExercicioItem(nome: "Abdominal Supra", selecionado: true),
        ExercicioItem(nome: "Abdominal Infra", selecionado: true),
        ExercicioItem(nome: "Abdominal Bicicleta", selecionado: true),
        ExercicioItem(nome: "Prancha", selecionado: true),
        ExercicioItem(nome: "Agachamento", selecionado: false),
        ExercicioItem(nome: "Leg Press", selecionado: false)
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.title3.bold())
                        .foregroundColor(.black.opacity(0.6))
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
                
                Spacer()
                Text("Novo Treino").font(.headline).fontWeight(.bold)
                Spacer()
                
                Button(action: { dismiss() }) {
                    Image(systemName: "checkmark")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.green)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            PhotosPicker(
                selection: $imagemSelecionada,
                matching: .images,
                photoLibrary: .shared()
            ) {
                
                ZStack {
                    Circle()
                        .fill(Color.green.opacity(0.8))
                        .frame(width: 70, height: 70)
                    
                    
                    if let imagemDeFundo = imagemDeFundo {
                        imagemDeFundo
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                    }
                }
            }

            .onChange(of: imagemSelecionada) { _, novoItem in
                Task {
                    
                    if let imagemCarregada = try? await novoItem?.loadTransferable(type: Image.self) {
                        imagemDeFundo = imagemCarregada
                    }
                }
            }
            .padding(.top, 8)
            
            
            VStack(spacing: 8) {
                TextField("Nome do Treino", text: $nomeDoTreino)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.6))
                    .multilineTextAlignment(.center)
                
                Divider().padding(.horizontal, 40)
            }
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Adicione seus exercícios:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach($exercicios) { $exercicio in
                            Button(action: {
                                exercicio.selecionado.toggle()
                            }) {
                                HStack(spacing: 16) {
                                    Image(systemName: exercicio.selecionado ? "checkmark.circle.fill" : "circle")
                                        .font(.title3)
                                        .foregroundColor(exercicio.selecionado ? .green : .gray.opacity(0.4))
                                    
                                    Text(exercicio.nome)
                                        .foregroundColor(.black)
                                        .font(.body)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 14)
                                .contentShape(Rectangle())
                            }
                            
                            if exercicio.id != exercicios.last?.id {
                                Divider().padding(.leading, 38)
                            }
                        }
                    }
                }
            }
            .padding(16)
            .background(Color(.systemGray6).opacity(0.5))
            .cornerRadius(24)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

struct ExercicioItem: Identifiable {
    let id = UUID()
    let nome: String
    var selecionado: Bool
}

#Preview {
    NovoTreinoView()
}
