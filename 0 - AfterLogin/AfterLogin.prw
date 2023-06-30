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
        Fun��o:    zSearch
        Descri��o: Abre uma tela de pesquisa de campos em um cadastro do Protheus
        Download:  https://terminaldeinformacao.com/2018/04/03/pesquisa-de-campos-em-telas-protheus/
    */
    If ExistBlock("zSearch",.F.,.T.)
        SetKey(K_CTRL_L, {|| u_zSearch() })
    Endif
    
    //Verifica se � admin
    If !lContinua
        lContinua := FWIsAdmin()
    EndIf

    If lContinua
        /*
        Atalho:    Ctrl + K
        Fun��o:    Analise
        Descri��o: Rotina de Analise de desbalanceamento de tabelas
        */
        If ExistBlock("ANALISE",.F.,.T.)
            SetKey(K_CTRL_K, {|| u_ANALISE() })
        Endif

        /*
            Atalho:    Shift + F7
            Fun��o:    zIsMVC
            Descri��o: Verifica se uma rotina � em MVC, montando tamb�m um exemplo de ponto de entrada
            Download:  https://terminaldeinformacao.com/2018/04/24/saiba-como-identificar-se-uma-funcao-e-em-mvc-como-fazer-seu-ponto-de-entrada/
        */
        If ExistBlock("zIsMVC",.F.,.T.)
            SetKey(K_SH_F7, {|| u_zIsMVC() })
        Endif
    
        /*
            Atalho:    Shift + F8
            Fun��o:    zMiniForm
            Descri��o: Abre uma tela para executar f�rmulas no Protheus
            Download:  https://terminaldeinformacao.com/2018/02/13/funcao-para-executar-formulas-protheus-12/
        */
        If ExistBlock("zMiniForm",.F.,.T.)
            SetKey(K_SH_F8, {|| u_zMiniForm() })
        Endif

        /*
            Atalho:    Shift + F9
            Fun��o:    zTiSQL
            Descri��o: Abre uma tela para execu��o de queries SQL, ideal para quem usa Cloud
            Download:  https://terminaldeinformacao.com/2021/11/05/tela-que-executa-consultas-sql-via-advpl/
        */
        If ExistBlock("zTiSQL",.F.,.T.)
            SetKey(K_SH_F9, { || u_zTiSQL() })
        Endif

        /*
            Atalho:    Shift + 11
            Fun��o:    zFazErro
            Descri��o: For�a um Error Log para analisar a pilha de chamadas e ver onde a fun��o esta travada
        */
        If ExistBlock("zFazErro",.F.,.T.)
            SetKey(K_SH_F11, {|| u_zFazErro() })
        Endif
    EndIf

    FWRestArea(aArea)
Return
