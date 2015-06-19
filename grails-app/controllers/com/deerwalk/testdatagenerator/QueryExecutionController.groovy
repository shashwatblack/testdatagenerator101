package com.deerwalk.testdatagenerator

import com.major.antlrTest.MyExprTest
import com.opencsv.CSVReader


class QueryExecutionController {

    def index() {}

    def execute(String domain, String query) {
        def defaultQuery = "table_name1.name=\"A.*\""
        List fieldNames = [], allEntries = []
        if (query != null) {
            defaultQuery = query;
            MyExprTest myExprTest = new MyExprTest()
            try {
                myExprTest.executeQuery(query)
                CSVReader csvReader = new CSVReader(new FileReader("src/main/resources/output/finalOutput.csv"))
                allEntries = csvReader.readAll();
            } catch (Exception ex) {
                ex.printStackTrace();
                //throw ex;
            }
            if (allEntries != null) {
                fieldNames = allEntries.remove(0);
                //Title case the field names
                for (int i = 0; i < fieldNames.size(); i++) {
                    fieldNames[i] = fieldNames[i].toString()[0].toUpperCase() + fieldNames[i].toString().substring(1);
                }
            }
        }
        //println(allEntries);
        [domain: domain, defaultQuery: defaultQuery, fieldNames: fieldNames, tableData: allEntries.toArray()]
    }

    def query_output() {
        render(file: "src/main/resources/output/finalOutput.csv", contentType: 'text/csv', fileName: "query_output.csv")
    }
}
