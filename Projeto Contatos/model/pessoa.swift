//
//  pessoa-model.swift
//  Atividade
//
//  Created by Moreira, Lucas Peres on 09/04/26.
//

class Pessoa {
    private var _nome: String
    private var _idade: Int
    private var _telefone: Int
    private var _email: String
    
    init(nome: String, idade: Int, telefone: Int, email: String) {
        self._nome = nome
        self._idade = idade
        self._telefone = telefone
        self._email = email
    }
    
    var nome: String {
        get { return _nome }
        set { _nome = newValue }
    }
    
    var idade: Int {
        get { return _idade }
        set { _idade = newValue }
    }
    
    var telefone: Int {
        get { return _telefone }
        set { _telefone = newValue }
    }
    
    var email: String {
        get { return _email }
        set { _email = newValue }
    }
    
    func printDados() {
        print("Nome: \(self._nome) | Idade: \(self._idade) | Telefone: \(self._telefone) | Email: \(self._email)")
    }
}
