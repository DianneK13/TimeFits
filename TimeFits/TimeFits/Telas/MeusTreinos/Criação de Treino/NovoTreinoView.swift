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
    @State private var dataModifiable: [ExerciciosData] = data
    
    var body: some View {
        VStack(spacing: 24) {
            
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .glassEffect(.regular.tint(.secondary).interactive())
                
                Spacer()
                Text("Novo Treino").font(.headline).fontWeight(.bold)
                Spacer()
                
                Button(action: { dismiss() }) {
                    Image(systemName: "checkmark")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .glassEffect(.regular.tint(.green).interactive())
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
                        .fill(Color.green)
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
                    .foregroundColor(.primary)
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
                        ForEach(dataModifiable.enumerated(), id: \.offset) { index, exercicio in

                            Button(action: {
                                dataModifiable[index].selecionado.toggle()
                            }) {
                                HStack(spacing: 16) {
                                    Image(systemName: exercicio.selecionado ? "checkmark.circle.fill" : "circle")
                                        .font(.title3)
                                        .foregroundColor(exercicio.selecionado ? .green : .gray)
                                    
                                    Text(exercicio.nome)
                                        .foregroundColor(.primary)
                                        .font(.body)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 14)
                                .contentShape(Rectangle())
                            }
                            
                            if dataModifiable[index] != dataModifiable.last {
                                Divider().padding(.leading, 38)
                            }
                        }
                    }
                }
            }
            .padding(16)
            .background(Color(.systemBackground))
            .cornerRadius(24)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemGray6))
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
