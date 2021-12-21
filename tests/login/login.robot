***Settings***
Documentation       Suite de Teste de Login do Administrador

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Browser Session
Test Teardown           Take Screenshot                 

***Test Cases***
Cenario: Login do Administrador
    [tags]          admin    
    Go To Login Page
    auth.Login With            admin@bodytest.com  pwd123
    User Should Be Login       Administrador
    
    [Teardown]                  Clear LS And Take Screenshot

Cenario: Senha incorreta
    [tags]          temp
    Go To Login Page
    Login With                 admin@bodytest.com  pwd12
    Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot        1

Cenario: Email invalido
    [tags]          temp
    Go To Login Page
    Login With                  admin&bodytest.com  pwd12
    Alert Text Should Be        Informe um e-mail válido  

Cenario: Senha não informada
    [tags]          temp
    Go To Login Page
    Login With                  admin@bodytest.com  ${EMPTY}
    Alert Text Should Be        A senha é obrigatória 

Cenario: Email não informada
    [tags]          temp
    Go To Login Page
    auth.Login With             ${EMPTY}    pwd123
    Alert Text Should Be        O e-mail é obrigatório

Cenario: Email e Senha não informados
    [tags]          temp
    Go To Login Page
    Login With                  ${EMPTY}    ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório 
    Alert Text Should Be        A senha é obrigatória 

Cenario: Usuário não cadastrado
    [tags]          temp
    Go To Login Page
    Login With                 josemar@bodytest.com  pwd12
    Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]                  Thinking And Take Screenshot        1



