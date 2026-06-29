//
//  ExerciciosData.swift
//  TimeFits
//
//  Created by Maria Clara Rodrigues de Almeida on 25/06/26.
//

struct ExerciciosData {
    let nome: String
    let imagem: String
    let velocidadeDeRepSecs: Int
    let tempoDeDescansoSecs: Int
    let quantDeSets: Int
}

let data: [ExerciciosData] = [
    // Flexões (Maria Clara)
    .init(
        nome: "Flexão de joelho",
        imagem: "kneePushUp",
        velocidadeDeRepSecs: 5,
        tempoDeDescansoSecs: 120,
        quantDeSets: 3
    ),
    .init(
        nome: "Flexão completa",
        imagem: "classicPushUP",
        velocidadeDeRepSecs: 5,
        tempoDeDescansoSecs: 150,
        quantDeSets: 3
    ),
    .init(
        nome: "Flexão fechada",
        imagem: "narrowPushUp",
        velocidadeDeRepSecs: 5,
        tempoDeDescansoSecs: 150,
        quantDeSets: 2
    ),
    .init(
        nome: "Flexão Escalonada Lateral",
        imagem: "sideStaggeredPushUp",
        velocidadeDeRepSecs: 5,
        tempoDeDescansoSecs: 150,
        quantDeSets: 2
    ),
    .init(
        nome: "Flexão arqueiro",
        imagem: "archerPushUp",
        velocidadeDeRepSecs: 5,
        tempoDeDescansoSecs: 180,
        quantDeSets: 3
    ),
    
    // ____ (Lais)
    
    
    // ____ (Luisa)
    
]

