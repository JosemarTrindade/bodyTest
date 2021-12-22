***Settings***
Documentation       Buscar alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session  
Test Teardown       Take Screenshot  

***Test Cases***

Cenario: Busca plano

    &{plan}         Create Dictionary           title=Plano Intermediario     duration=6     price=9.99     total=R$ 59,94
    ${title}        Set Variable                ${plan.title}

    Remove Plan By Title                ${title}  
    Insert Plan                         ${plan}
    Go To Plans
    Search Plan By Title                ${title}
    Plan Title Should Be Visible        ${title}
    Total Itens Should Be               1

Cenario: Registro não encontrado

    ${name}     Set Variable            Plano Gold

    Remove Student By Name              ${name} 
    Go To Plans
    Search Plan By Title                ${name} 
    Register Should Not Be Found
