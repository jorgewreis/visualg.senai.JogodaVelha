Algoritmo "Atividade em grupo"
   // Disciplina   : [Linguagem e Lógica de Programação]
   // Professor   : Mailson
   // Autor(a)    : Grupo
   // Data atual  : 05/04/2023
Var
   optionMenuInicial, partidas: inteiro
   placar: vetor[1..2, 1..10]de caracter // Nome - Pontos (todas as partidas)
   jogador: vetor[1..3,1..2]de caracter  // Nome - Pontos - Vencedor (partida atual)
   jogo: vetor[1..9]de caracter          // Jogadas
   optionMenus: caracter                 // verifica se quer jogar novamente

   // Introdução com logo do jogo
   procedimento Intro
      inicio
      escreval ("")
      escreval ("     __   __    ___   __     ____   __     _  _  ____  __    _  _   __ ")
      escreval ("   _(  ) /  \  / __) /  \   (    \ / _\   / )( \(  __)(  )  / )( \ / _\")
      escreval ("  / \) \(  O )( (_ \(  O )   ) D (/    \  \ \/ / ) _) / (_/\) __ (/    \")
      escreval ("  \____/ \__/  \___/ \__/   (____/\_/\_/   \__/ (____)\____/\_)(_/\_/\_/")
      escreval ("")
      escreval ("")
      escreval ("  Desenvolvedores:")
      escreval ("   - Fabio Arthur")
      escreval ("   - Jorge Reis")
      escreval ("   - Lucas Lima")
      escreval ("   - Samuel Oliveira")
      escreval ("")
      escreval ("")
      escreva ("  pressione qualquer tecla para inicial o jogo ")
      leia (optionMenuInicial)
   fimprocedimento
   
   // Cabeçalho que se repete em todas as pages
   procedimento Cabecalho
      inicio
      escreval (" *** JOGO DA VELHA *** ")
      escreval (" versão 1.02 - atualizado em 09/04/2023")
      escreval ("")
   fimprocedimento
   
   Funcao SorteioPartida: inteiro
      Var
      valor: inteiro

      Inicio
      aleatorio on
      Leia(valor)
      aleatorio off
      valor <- (valor mod 2) + 1
        retorne valor
   Fimfuncao
   
   // Gera e mostra tabuleiro atualizado
   procedimento AtualizaTabuleiro
      var
      contadorTabuleiro, contadorJogo: inteiro
      temp: caracter

      inicio
      para contadorTabuleiro de 0 até 2 faca
         escreval ("")
         escreval (" + --- + --- + --- +")
         para contadorJogo de 1 ate 3 faca
            temp <- jogo[contadorTabuleiro*3+contadorJogo]
            se (temp = "") entao
               escreva (" |    ")
            senao
               escreva (" |  ", temp, " ")
            fimse
         fimpara
         escreva(" | ")
      fimpara
      escreval ("")
      escreval (" + --- + --- + --- +")
      escreval ("")
   fimprocedimento
   
   // Verifica se já existe um vencedor da partida
   funcao VerificaVencedor(x: inteiro): inteiro
      var
      contadorPlacar, contadorJogada, temp, temp2, jogadas, venc: inteiro
      verifica: caracter

      inicio
      jogadas <- x
      
      // verifica linhas
      para contadorPlacar de 0 ate 2 faca
         para contadorJogada de 1 ate 3 faca
            temp2 <- contadorPlacar*3+contadorJogada
            verifica <- verifica + jogo[temp2]
         fimpara
         temp <- (9-jogadas)+(partidas)
         se (verifica = "XXX") entao
            venc <- 1
            jogador[2,1] <- numpcarac(temp)
            placar[1,contadorPlacar+1] <- jogador[1,1]
            placar[2,contadorPlacar+1] <- jogador[2,1]
         senao
           se (verifica = "OOO") entao
            venc <- 2
            jogador[2,2] <- numpcarac(temp)
            placar[1,contadorPlacar+1] <- jogador[1,2]
            placar[2,contadorPlacar+1] <- jogador[2,2]
           fimse
         fimse
         verifica <- ""
      fimpara

      // verifica colunas
      para contadorPlacar de 1 ate 3 faca
         para contadorJogada de 0 ate 2 faca
            temp2 <- contadorPlacar+contadorJogada*3
            verifica <- verifica + jogo[temp2]
         fimpara
         temp <- (9-jogadas)+(partidas)
         se (verifica = "XXX") entao
            venc <- 1
            jogador[2,1] <- numpcarac(temp)
            placar[1,contadorPlacar+1] <- jogador[1,1]
            placar[2,contadorPlacar+1] <- jogador[2,1]
         senao
           se (verifica = "OOO") entao
            venc <- 2
            jogador[2,2] <- numpcarac(temp)
            placar[1,contadorPlacar+1] <- jogador[1,2]
            placar[2,contadorPlacar+1] <- jogador[2,2]
           fimse
         fimse
         verifica <- ""
      fimpara
      
      // verifica diagonal 1
      para contadorPlacar de 0 ate 2 faca
         temp2 <- contadorPlacar*3+(contadorPlacar+1)
         verifica <- verifica + jogo[temp2]
      fimpara
      temp <- (9-jogadas)+(partidas)
      se (verifica = "XXX") entao
         venc <- 1
         jogador[2,1] <- numpcarac(temp)
         placar[1,contadorPlacar+1] <- jogador[1,1]
         placar[2,contadorPlacar+1] <- jogador[2,1]
      senao
        se (verifica = "OOO") entao
         venc <- 2
         jogador[2,2] <- numpcarac(temp)
         placar[1,contadorPlacar+1] <- jogador[1,2]
         placar[2,contadorPlacar+1] <- jogador[2,2]
        fimse
      fimse
      verifica <- ""
      
      // verifica diagonal 2
      para contadorPlacar de 1 ate 3 faca
         temp2 <- contadorPlacar*3-(contadorPlacar-1)
         verifica <- verifica + jogo[temp2]
      fimpara
      temp <- (9-jogadas)+(partidas)
      se (verifica = "XXX") entao
         venc <- 1
         jogador[2,1] <- numpcarac(temp)
         placar[1,contadorPlacar+1] <- jogador[1,1]
         placar[2,contadorPlacar+1] <- jogador[2,1]
         interrompa
      senao
        se (verifica = "OOO") entao
         venc <- 2
         jogador[2,2] <- numpcarac(temp)
         placar[1,contadorPlacar+1] <- jogador[1,2]
         placar[2,contadorPlacar+1] <- jogador[2,2]
         interrompa
        fimse
      fimse
      verifica <- ""
      
      // verifica empate
      se (jogadas = 9) entao
         venc <- 3
         temp <- (9-jogadas)+(partidas)
         jogador[2,1] <- numpcarac(temp)
         jogador[2,2] <- numpcarac(temp)
         para contadorPlacar de 1 ate 10 faca
            temp2 <- caracpnum(placar[2,contadorPlacar])
            se (temp2 = 0) ou (temp > temp2) entao
               placar[1,contadorPlacar] <- jogador[1,1]
               placar[2,contadorPlacar] <- jogador[2,1]
               interrompa
            fimse
         fimpara
         para contadorPlacar de 1 ate 10 faca
            temp2 <- caracpnum(placar[2,contadorPlacar])
            se (temp2 = 0) ou (temp > temp2) entao
               placar[1,contadorPlacar] <- jogador[1,2]
               placar[2,contadorPlacar] <- jogador[2,2]
               interrompa
            fimse
         fimpara
      fimse
      
      retorne venc
   fimfuncao

   // Opção do Menu - Jogo Tradicional
   procedimento MenuTradicional
      var
      contador, vencedor, jogadas, jogadorInicial, jogada: inteiro
      
      inicio
      limpatela
      // Inicio do jogo
      enquanto (vencedor = 0) faca
         limpatela
         Cabecalho
         escreval (" JOGO - MODO TRADICIONAL")
         escreval ("")
         escreval (" ---------------------------------------")
         escreval (" Partida: ", partidas, " -", jogadas, " jogada(s)")
         escreval (" ---------------------------------------")
         escreval ("")
         se (jogadas = 0) entao
            jogadorInicial <- SorteioPartida
            limpatela
            Cabecalho
            escreval (" JOGO - MODO TRADICIONAL")
            escreval ("")
            escreval (" ---------------------------------------")
            escreval (" Partida: ", partidas, " -", jogadas, " jogada(s)")
            escreval (" ---------------------------------------")
            escreval ("")
            escreval (" O jogador sorteado para iniciar foi ", jogador[1,jogadorInicial])
            partidas <- partidas + 1
         fimse

         AtualizaTabuleiro
         
         se (jogadorInicial = 1) entao
            escreval ("")
            escreva (" ", jogador[1,1], ", informe sua jogada: ")
            leia (jogada)
            enquanto (jogo[jogada] <> "") faca
               escreval ("")
               escreva (" posição já ocupada, insira um valor diferente: ")
               leia (jogada)
            fimenquanto
            jogo[jogada] <- "X"
            jogadorInicial <- 2
            jogadas <- jogadas + 1
         senao
            escreval ("")
            escreva (" ", jogador[1,2], ", informe sua jogada: ")
            leia (jogada)
            enquanto (jogo[jogada] <> "") faca
               escreval ("")
               escreva (" posição já ocupada, insira um valor diferente: ")
               leia (jogada)
            fimenquanto
            jogo[jogada] <- "O"
            jogadorInicial <- 1
            jogadas <- jogadas + 1
         fimse
         vencedor <- VerificaVencedor(jogadas)
      fimenquanto
      
      se (vencedor = 3) entao
         limpatela
         escreval ("")
         escreval (" O JOGO TERMINOU EMPATADO !!!")

      senao
         se (vencedor = 1) ou (vencedor = 2) entao
            limpatela
            escreval ("")
            escreval (" O VENCEDOR FOI ", maiusc(jogador[1,vencedor]))
         fimse
      fimse

      escreval ("")
      escreva (" Deseja jogar novamente? [S] Sim  -  [N] Não ")
      leia (optionMenus)
      vencedor <- 0
      para contador de 1 ate 9 faca
         jogo[contador] <- ""
      fimpara
      se (optionMenus = "S") ou (optionMenus = "s") entao
         MenuTradicional
      senao
         partidas <- 0
      fimse
   fimprocedimento
   
   // Opção do Menu - Placar
   procedimento MenuPlacar
      var
      contadorPlacar: inteiro
      
      inicio
      limpatela
      Cabecalho
      escreval (" PLACAR - TOP 10")
      escreval ("")
      para contadorPlacar de 1 ate 10 faca
         escreval ("   ", contadorPlacar:2, ". ", placar[1,contadorPlacar]:30, " - ", placar[2,contadorPlacar]:4, "pontos")
      fimpara
      escreval ("")
      escreva (" pressione qualquer tecla para voltar: ")
      leia (optionMenuInicial)
      optionMenuInicial <- 1
   fimprocedimento

Inicio
   // Inicio da execução do código
   Intro
   optionMenuInicial <- 1
   enquanto (optionMenuInicial > 0) e (optionMenuInicial < 4) faca
      limpatela
      Cabecalho
      escreval (" Seja bem vindo(a)")
      escreval ("")
      escreval (" [1] Jogo - Tradicional")
      escreval (" [2] Placar - Top 10")
      escreval ("")
      escreval (" [0] Sair")
      escreval ("")
      escreva (" Informe a opção desejada para continuar: ")
      leia (optionMenuInicial)
      
      escolha (optionMenuInicial)
         caso 0
            optionMenuInicial <- 0
         caso 1
            limpatela
            Cabecalho
            escreval (" JOGO - MODO TRADICIONAL")
            escreval ("")
            // Informar nome dos jogadores
            escreva (" Informe o nome do primeiro jogador (X): ")
            leia (jogador[1,1])
            escreva (" Informe o nome do segundo jogador (O): ")
            leia (jogador[1,2])
            MenuTradicional
         caso 2
            MenuPlacar
         outrocaso
            optionMenuInicial <- 1
      fimescolha
      
   fimenquanto

Fimalgoritmo