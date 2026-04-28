//
//  Quiz.swift
//  Quiz
//
//  Created by Moreira, Lucas Peres on 23/04/26.
//

import SwiftUI

struct Quiz: View {
    let perguntas: [Questao] = [
        Questao(
            id: 0,
            categoria: Categoria.programacao,
            titulo: "Qual linguagem é usada para iOS?",
            respostas: [
                Resposta(id: 0, titulo: "Java", estaCorreta: false),
                Resposta(id: 1, titulo: "Swift", estaCorreta: true),
                Resposta(id: 2, titulo: "Python", estaCorreta: false),
                Resposta(id: 3, titulo: "C#", estaCorreta: false)
            ]
        ),
        Questao(
            id: 1,
            categoria: Categoria.programacao,
            titulo: "Qual empresa criou o Swift?",
            respostas: [
                Resposta(id: 0, titulo: "Google", estaCorreta: false),
                Resposta(id: 1, titulo: "Apple", estaCorreta: true),
                Resposta(id: 2, titulo: "Microsoft", estaCorreta: false),
                Resposta(id: 3, titulo: "IBM", estaCorreta: false)
            ]
        )
    ]
    
    @State private var indiceAtual = 0
    @State private var acertos = 0
    @State private var respostaSelecionada: Resposta? = nil
    
    
    func proximaPergunta() {
        if indiceAtual < perguntas.count - 1 {
            indiceAtual += 1
            respostaSelecionada = nil
        } else {
            print("Quiz finalizado")
        }
    }
    
    func corDaResposta(_ resposta: Resposta) -> Color {
        guard let selecionada = respostaSelecionada else {
            return Color.gray
        }

        if resposta.id == selecionada.id {
            return resposta.estaCorreta ? .green : .red
        }

        return resposta.estaCorreta ? Color.green.opacity(0.6) : Color.gray
    }

    
    var body: some View {
        
        Text("Pergunta \(indiceAtual + 1) de \(perguntas.count)")
            .font(.caption)
            .foregroundColor(.secondary)
            .padding()
        
        
        Text(perguntas[indiceAtual].titulo)
            .font(.title3)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 80)
        
        
        VStack(spacing: 12) {
            ForEach(perguntas[indiceAtual].respostas, id: \.id) { resposta in
                Button {
                    respostaSelecionada = resposta
                } label: {
                    Text(resposta.titulo)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(corDaResposta(resposta))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .disabled(respostaSelecionada != nil)
            }
        }
        
        
        Button {
            proximaPergunta()
        } label: {
            Text(indiceAtual == perguntas.count - 1 ? "Finalizar" : "Próxima")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(respostaSelecionada == nil ? Color.white : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(14)
        }
        .disabled(respostaSelecionada == nil)
        .padding()

    }
}

#Preview {
    Quiz()
}
