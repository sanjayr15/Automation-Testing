*** Settings ***
Resource    ../../Test/Backend/backend.robot
Resource    ../../Test/Fronttest/front.robot
Library    OperatingSystem
Library    MongoDBLibrary

Suite Setup       Connect To MongoDB    mongodb+srv://admin:admin@taskapp.bytgp.mongodb.net/
Suite Teardown    Disconnect From MongoDB

*** Variables ***
${URL} =        localhost:8080
${EMAIL} =      aarthi.badam55@gmail.com
${PASSWORD} =   bla@aarthi

*** Variables ***
${frontcount}
${backcount}

*** Test Cases ***

Collecting data from frontend
        [Tags]    Login
        @{frontcount}     front.data to be accessed from frontend
        log many    @{frontcount}

Collecting the data from backend
        [Tags]    Backend
        @{backcount}     backend.Data should be accessed from database
        log many     @{backcount}

Verifying the variables
        [Tags]      verify
        @{frontcount}     front.data to be accessed from frontend
        @{backcount}      backend.Data should be accessed from database
        FOR    ${item}     IN      @{frontcount}
               log     ${item}
               should contain any    @{backcount}    ${item}
        END
        log many  @{frontcount}
        log many  @{backcount}





        #robot -d Result -i verify Test/EndtoEnd/endtoend.robot
