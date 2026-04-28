//
//  opcoes-model.swift
//  Atividade
//
//  Created by Moreira, Lucas Peres on 09/04/26.
//

var contatos: [Pessoa] = [
    Pessoa(nome: "Lucas", idade: 29, telefone: 7227, email: "lucas@gmail.com")
];

func cadastraContato() {
    print("*Regras para novo contato*")
    print(" - Nomes não podem ser repetidos")
    print(" - Todos os dados devem ser preenchidos\n")
    
    print("Nome do contato:")
    let nome = readLine()!
    if (validaNomeDuplicadoOuVazio(nome)) {
        return
    }
    
    print("Idade:")
    let idade = Int(readLine()!)!
    
    print("Telefone:")
    let telefone = Int(readLine()!)!
    
    print("E-mail:")
    let email = readLine()!
    
    let novoContato = Pessoa(nome: nome, idade: idade, telefone: telefone, email: email)
    contatos.append(novoContato)
    
    print("Contato adicionado com sucesso!\n")
}

func validaNomeDuplicadoOuVazio(_ nome: String) -> Bool {
    if (nome.isEmpty) {
        print("Nome não pode estar em branco")
        return true
    }
    
    var nomeExistente: Bool = false
    for contato in contatos {
        if contato.nome == nome {
            print("Nome já cadastrado. Tente novamente")
            nomeExistente = true
            break
        }
    }
    
    return nomeExistente
}

func listaContatos() {
    if (contatos.isEmpty) {
        print("Nenhum contato cadastrado")
        return
    }
    
    for contato in contatos {
        contato.printDados()
    }
    print("\n")
}

func excluirContato() {
    print("Digite o nome do contato que deseja excluir:")
    let nomeBuscado = readLine()!
    
    var contatoEncontrado: Pessoa? = nil
    for contato in contatos {
        if contato.nome == nomeBuscado {
            contatoEncontrado = contato
            break
        }
    }
    
    if let contato = contatoEncontrado {
        contatos.removeAll { $0.nome == contato.nome }
        print("Contato excluído com sucesso!")
    } else {
        print("Contato não encontrado.")
    }
}

func alterarContato() {
    print("Digite o nome do contato que deseja alterar:")
    let nomeBuscado = readLine()!
    
    var contatoEncontrado: Pessoa? = nil
    for contato in contatos {
        if contato.nome == nomeBuscado {
            contatoEncontrado = contato
            break
        }
    }
    
    if let contato = contatoEncontrado {
        print("Nome atual: \(contato.nome)")
        print("Deseja alterar o nome? [S/N]")
        
        var resposta = readLine()!.uppercased()
        if (resposta == "S") {
            print("Novo nome:")
            let novoNome = readLine()!
            
            if (validaNomeDuplicadoOuVazio(novoNome)) {
                print("O nome não pode ser vazio ou duplicado")
                return
            }
            
            contato.nome = novoNome
        }
        
        print("Idade atual: \(contato.idade)")
        print("Deseja alterar a idade? [S/N]")
        
        resposta = readLine()!.uppercased()
        if (resposta == "S") {
            print("Nova idade:")
            let novaIdade = Int(readLine()!)!
            
            contato.idade = novaIdade
        }
        
        print("Telefone atual: \(contato.telefone)")
        print("Deseja alterar o telefone? [S/N]")
        
        resposta = readLine()!.uppercased()
        if (resposta == "S") {
            print("Novo telefone:")
            let novoTelefone = Int(readLine()!)!
            
            contato.telefone = novoTelefone
        }
        
        print("Email atual: \(contato.email)")
        print("Deseja alterar o email? [S/N]")
        
        resposta = readLine()!.uppercased()
        if (resposta == "S") {
            print("Novo email:")
            let novoEmail = readLine()!
            
            contato.email = novoEmail
        }
        
        print("Contato atualizado com sucesso!")
    } else {
        print("Contato não encontrado.")
    }
}
