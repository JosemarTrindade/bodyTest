***Settings***
Documentation       Ações do menu superior de navegação

***Keywords***
Go To Students
    Click       css=a[href$=alunos]
    Wait For Elements State      css=h1 >> text=Gestão de Alunos     visible     5

User Should Be Login    
    [Arguments]     ${user_name}
    Get Text        css=aside strong        Should Be       ${user_name}

