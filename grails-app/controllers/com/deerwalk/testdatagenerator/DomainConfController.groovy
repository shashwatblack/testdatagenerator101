package com.deerwalk.testdatagenerator

import com.major.antlrTest.domainConfiguration.Utils

class DomainConfController {

    def index() {
        redirect(action: 'add')
    }

    def add() {
        Utils utils = new Utils()
        List <String> domainNameList = utils.domainNameList
        [domainNameList: domainNameList, defaultDomain: domainNameList[0]]
    }
}
