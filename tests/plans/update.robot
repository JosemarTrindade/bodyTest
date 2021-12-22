***Settings***
Documentation       Cadastro de alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session  

***Test Cases***
Cenario: Atualizar plano já cadastrado

    ${fixture}          Get Json            plan-update
    ${before}           Set Variable        ${fixture.before} 
    ${after}            Set Variable        ${fixture.after}   

    Remove Plan By Title                    ${before.title} 
    Remove Plan By Title                    ${after.title}

    Insert Plan                             ${after}
    Go To Plans
    Search Plan By Title                    ${after.title}
    Go To Plan Update Form                  ${after.title}
    Fill Plan Form                          ${after}
    Total Plan Should Be                    ${after.total}
    Submit Student Plan
    Toaster Text Should Be                  Plano Atualizado com sucesso

    [Teardown]      Thinking And Take Screenshot    2