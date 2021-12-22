***Settings***
Documentation       Cadastro de Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session  
Test Teardown       Take Screenshot  

***Test Cases***
Cenario: Calcular o preço total do plano

    &{plan}         Create Dictionary           title=Josemar Trindade      duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Total Plan Should Be        ${plan.total}

Cenario: Novo Plano

    &{plan}         Create Dictionary           title=Plano Avançado     duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Total Plan Should Be        ${plan.total}
    Submit Student Plan
    Toaster Text Should Be      Plano cadastrado com sucesso

Cenario: Campos devem ser obrigatórios

    @{expect_alerts}        Set Variable        Informe o título do plano     Informe a duração do plano em meses      
    @{got_alerts}           Create List

    Go To Plans
    Go To Form Plan
    Submit Student Plan

    FOR     ${index}        IN RANGE    1   3

        ${span}                   Get Required Alerts     ${index}
        Append To List            ${got_alerts}           ${span}       
    END 

    Lists Should Be Equal         ${expect_alerts}        ${got_alerts}  









