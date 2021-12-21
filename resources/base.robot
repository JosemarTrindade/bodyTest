***Settings***
Documentation       Tudo começa aqui, meu arquivo base do meu projeto de automação

Library             Browser
Library             Collections
Library             OperatingSystem
Library             libs/DeloreanLibrary.py

Resource            actions/auth.robot
Resource            actions/students.robot

Resource            actions/nav.robot
Resource            actions/components.robot

*** Keywords ***
Start Browser Session
    New Browser     chromium        False
    New Page        about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page
    Login With                  admin@bodytest.com       pwd123
    User Should Be Login        Administrador   

Clear LS And Take Screenshot
    Take Screenshot
    LocalStorage Clear 

Thinking And Take Screenshot
    [Arguments]         ${timeout}

    Sleep               ${timeout} 
    Take Screenshot

### Helpers ####
Get Json
    [Arguments]     ${file_name}

    
    ${file}=            Get File        ${EXECDIR}/resources/fixtures/${file_name}.json 
   # ${json_object}      Evaluate        json.loads($file)       json
    ${json_object}      Evaluate        robot.utils.dotdict.DotDict(json.loads($file))
    [Return]            ${json_object}   


