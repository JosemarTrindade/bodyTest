***Settings***
Documentation       Remover de alunos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Admin Session  

***Test Cases***

Cenario: Remover plano cadastrado

    &{plan}         Create Dictionary           title=Plano Avançado     duration=12     price=19.99     total=R$ 239,88
    ${title}        Set Variable                ${plan.title}

    Insert Plan                 ${plan}
    Go To Plans
    Search Plan By Title        ${title}
    Remove Plan                 ${title}
    Confirm Removal Plan
    Toaster Text Should Be      Plano removido com sucesso
    Plan Should Not Visible     ${title}

    [Teardown]                  Thinking And Take Screenshot    2
