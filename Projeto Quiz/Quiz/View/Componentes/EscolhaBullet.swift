//
//  EscolhaBullet.swift
//  Quiz
//
//  Created by Moreira, Lucas Peres on 23/04/26.
//

import SwiftUI

struct EscolhaBullet: View {
    
    let titulo: String
    @State var isSelected: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: {
            isSelected = !isSelected
            action()
        }) {
            Text(titulo)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.primary : Color(.systemGray6))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(12)
        }
    }
}

#Preview {
    EscolhaBullet(
        titulo: "Programação",
        isSelected: false
    ){
        return
    }
    .padding()

}

