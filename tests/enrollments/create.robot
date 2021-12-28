***Settings***
Documentation       Gestão de Matriculas

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session  
Test Teardown       Take Screenshot  

***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido

    ${fixture}                  Get Json        enroll-dates

    ${john}         Set Variable        ${fixture.student}
    ${black}        Set Variable        ${fixture.plan}   

    Insert Student              ${john}
    Insert Plan                 ${black}          
    
    Go To Enrolls
    Go To Form Enroll
    Select Student              ${john.name}
    Select Plan                 ${black.title} 
    Start Date Should Today
    End Date Should Be          ${fixture.days} 

