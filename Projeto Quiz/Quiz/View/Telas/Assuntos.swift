//
//  Assuntos.swift
//  Quiz
//
//  Created by Moreira, Lucas Peres on 23/04/26.
//

import SwiftUI

struct Assuntos: View {
    
    private let todasCategorias: [Categoria] = Categoria.allCases
    
    @State var categoriasSelecionadas: [Categoria] = []
    
    func toggleCategoria(_ categoria: Categoria) -> Void {
        if (categoriasSelecionadas.contains(categoria)) {
            categoriasSelecionadas.removeAll(where: { $0 == categoria })
        } else {
            categoriasSelecionadas.append(categoria)
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Quais assuntos você quer testar?")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Assuntos escolhidos: \(categoriasSelecionadas.count)/1")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        
        
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 140))],
            spacing: 12
        ) {
            ForEach(todasCategorias, id: \.self) { categoria in
                EscolhaBullet(
                    titulo: categoria.rawValue,
                    isSelected: categoriasSelecionadas.contains(categoria)
                ) {
                    toggleCategoria(categoria)
                }
            }
        }
        .padding()

        
        Button {
                print("Selecionadas:", categoriasSelecionadas)
            } label: {
                Text("Iniciar")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(categoriasSelecionadas.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            .disabled(categoriasSelecionadas.isEmpty)
            .padding()

        
    }
}

#Preview {
    Assuntos()
}
