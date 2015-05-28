package com.deerwalk.testdatagenerator

import java.nio.file.Path


class QueryExecutionController {

    def index() { }

    def execute(String domain) {

        Path outputPath
        MyExprTest myExprTest = new MyExprTest()
        //try {
            outputPath = myExprTest.executeQuery("table_name1.name=\"A.*\"")
        //} catch (Exception ex) {
        //    ex.printStackTrace();
        //    throw ex;s
        //}

        def Aito = outputPath.toString();
        def res1 = [name:Aito, position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"]
        def res2 = [name:"Bito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"]
        def res3 = [name:"Cito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"]
        def res4 = [name:"Dito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"]
        def res5 = [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"]
        def res6 = [[name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                    [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1300.00"]]

        [domain: domain, results: [res1, res2, res3, res4, res5] + res6]
    }
}
