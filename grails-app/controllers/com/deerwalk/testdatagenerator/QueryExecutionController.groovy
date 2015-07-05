package com.deerwalk.testdatagenerator

import com.major.antlrTest.MyExprTest
import com.major.antlrTest.domainConfiguration.Domain
import com.major.antlrTest.domainConfiguration.MapGenerate
import com.opencsv.CSVReader
import org.apache.commons.io.FileUtils

import java.nio.file.Path


class QueryExecutionController {

    def List<Path> filePaths

    def index() {}

    def execute(String domain, String query) {
        def defaultQuery = "table_name1.name=\"A.*\""
        List fieldNames = [], allEntries = []
        if (query != null) {
            defaultQuery = query;
            try {
                // clean output directory to avoid past results messing up current ones
                //FileUtils.cleanDirectory(new File("src/main/resources/output/"))
                filePaths = MyExprTest.executeQuery(query, domain)
                CSVReader csvReader = new CSVReader(new FileReader(filePaths.get(0).toString()))
                allEntries = csvReader.readAll();
            } catch (Exception ex) {
                ex.printStackTrace();
                //throw ex;
            }
            if (allEntries.size() > 0) {
                fieldNames = allEntries.remove((int) 0);
                //Title case the field names
                for (int i = 0; i < fieldNames.size(); i++) {
                    fieldNames[i] = fieldNames[i].toString()[0].toUpperCase() + fieldNames[i].toString().substring(1);
                }
            }
        }
        [domain: domain, defaultQuery: defaultQuery, fieldNames: fieldNames, tableData: allEntries.toArray()]
    }

    def query_output() {
        render(file: filePaths.get(0).toString(), contentType: 'text/csv', fileName: "query_output.csv")
    }
}
