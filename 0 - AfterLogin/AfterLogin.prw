//Bibliotecas
#Include "TOTVS.ch"
  
/*/{Protheus.doc} User Function AfterLogin
Ponto de Entrada ao abrir o sistema se for SIGAADV ou alguma rotina se for SIGAMDI
@type  Function
@author Atilio
@since 22/09/2021
@see https://tdn.totvs.com/pages/viewpage.action?pageId=6815186
/*/
  
User Function AfterLogin()
    Local aArea := FWGetArea()
    Local lContinua := .F.
  
    /*
        Atalho:    Ctrl + L
        Função:    zSearch
        Descrição: Abre uma tela de pesquisa de campos em um cadastro do Protheus
        Download:  https://terminaldeinformacao.com/2018/04/03/pesquisa-de-campos-em-telas-protheus/
    */
    If ExistBlock("zSearch",.F.,.T.)
        SetKey(K_CTRL_L, {|| u_zSearch() })
    Endif
    
    //Verifica se é admin
    If !lContinua
        lContinua := FWIsAdmin()
    EndIf

    If lContinua
        /*
        Atalho:    Ctrl + K
        Função:    Analise
        Descrição: Rotina de Analise de desbalanceamento de tabelas
        */
        If ExistBlock("ANALISE",.F.,.T.)
            SetKey(K_CTRL_K, {|| u_ANALISE() })
        Endif

        /*
            Atalho:    Shift + F7
            Função:    zIsMVC
            Descrição: Verifica se uma rotina é em MVC, montando também um exemplo de ponto de entrada
            Download:  https://terminaldeinformacao.com/2018/04/24/saiba-como-identificar-se-uma-funcao-e-em-mvc-como-fazer-seu-ponto-de-entrada/
        */
        If ExistBlock("zIsMVC",.F.,.T.)
            SetKey(K_SH_F7, {|| u_zIsMVC() })
        Endif
    
        /*
            Atalho:    Shift + F8
            Função:    zMiniForm
            Descrição: Abre uma tela para executar fórmulas no Protheus
            Download:  https://terminaldeinformacao.com/2018/02/13/funcao-para-executar-formulas-protheus-12/
        */
        If ExistBlock("zMiniForm",.F.,.T.)
            SetKey(K_SH_F8, {|| u_zMiniForm() })
        Endif

        /*
            Atalho:    Shift + F9
            Função:    zTiSQL
            Descrição: Abre uma tela para execução de queries SQL, ideal para quem usa Cloud
            Download:  https://terminaldeinformacao.com/2021/11/05/tela-que-executa-consultas-sql-via-advpl/
        */
        If ExistBlock("zTiSQL",.F.,.T.)
            SetKey(K_SH_F9, { || u_zTiSQL() })
        Endif

        /*
            Atalho:    Shift + 11
            Função:    zFazErro
            Descrição: Força um Error Log para analisar a pilha de chamadas e ver onde a função esta travada
        */
        If ExistBlock("zFazErro",.F.,.T.)
            SetKey(K_SH_F11, {|| u_zFazErro() })
        Endif
    EndIf

    FWRestArea(aArea)
Return
