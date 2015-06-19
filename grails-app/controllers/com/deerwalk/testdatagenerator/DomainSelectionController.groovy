package com.deerwalk.testdatagenerator

import com.major.antlrTest.domainConfiguration.Utils

class DomainSelectionController {

    def index() {
        redirect(action: 'select')
    }

    def select() {
        Utils utils = new Utils()
        List <String> domainNameList = utils.domainNameList
        [domainNameList: domainNameList, defaultDomain: domainNameList[-1]]
    }
}
