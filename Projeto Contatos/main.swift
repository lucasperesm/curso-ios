//
//  main.swift
//  Atividade
//
//  Created by Moreira, Lucas Peres on 09/04/26.
//

import Foundation


var appRodando: Bool = true;

while appRodando {
    let opcao = mostraOpcoes()
    print("========== \(retornaTextoOpcao(opcao)) ==========\n")
    
    if (opcao == 5) {
        appRodando = false;
    } else {
        executaOpcao(opcao)
    }
}

func mostraOpcoes() -> Int {
    print("\nCarregando opções...")
    Foundation.sleep(UInt32(3))
    
    print("\nQual opção deseja escolher?")
    print("1 - Cadastrar")
    print("2 - Listar")
    print("3 - Alterar")
    print("4 - Excluir")
    print("5 - Sair\n")
    
    var opcao: Int = Int(readLine(strippingNewline: true)!) ?? 5;
    if (opcao < 1 || opcao > 5) {
        opcao = 5
    };
    return opcao
}

func executaOpcao(_ opcao: Int) {
    switch opcao {
        case 1:
            cadastraContato()
        case 3:
            alterarContato()
        case 4:
            excluirContato()
        default:
            listaContatos()
    }
}

func retornaTextoOpcao(_ opcao: Int) -> String {
    switch opcao {
        case 1:
            return "Cadastro"
        case 2:
            return "Listagem"
        case 3:
            return "Alteração"
        case 4:
            return "Exclusão"
        default:
            return "Sair"
    }
}
