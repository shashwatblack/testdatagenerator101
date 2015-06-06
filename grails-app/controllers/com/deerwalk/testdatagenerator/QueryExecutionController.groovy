package com.deerwalk.testdatagenerator

import com.major.antlrTest.MyExprTest
//import com.opencsv.CSVReader


class QueryExecutionController {

    def index() { }

    def execute(String domain) {

        int outputPath = 8;
        MyExprTest myExprTest = new MyExprTest()
        List allEntries
        try {
            myExprTest.executeQuery("table_name1.name=\"A.*\" AND table_name1.id<50")
//            CSVReader csvReader = new CSVReader(new FileReader("src/main/resources/output/finalOutput.csv"))
//            allEntries = csvReader.readAll();
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw ex;
        }

        def Aito = outputPath.toString();
        def fieldNames = ['Name', 'Position', 'Office', 'Age', 'Salary'];
        def res = [[name:Aito, position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Bito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Cito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Dito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   /*[name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1200.00"],*/
                   [name:"Eito", position:"Flight Attendant", office:"lol", age:"35", salary: "\$1300.00"]]

        [domain: domain, fieldNames: fieldNames, tableData: res]
    }
}
