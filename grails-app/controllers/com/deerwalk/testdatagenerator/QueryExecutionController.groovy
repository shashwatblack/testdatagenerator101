package com.deerwalk.testdatagenerator

import com.major.antlrTest.MyExprTest
import com.major.antlrTest.domainConfiguration.Domain
import com.major.antlrTest.domainConfiguration.MapGenerate
import com.opencsv.CSVReader
import org.apache.commons.io.FileUtils

import java.nio.file.Path
import groovy.io.FileType

class QueryExecutionController {

    def List<Path> filePaths

    def index() {}

    def execute(String domain, String query, String numData) {
        def defaultQuery = "table_name1.name=\"A.*\""
        def defaultNumData = 50
        def outputFilesList = []
        def defaultTable = ""
        List fieldNames = [], allEntries = []
        if (query != null) {
            defaultQuery = query;
            try {
                defaultNumData = Integer.parseInt(numData)
            } catch (Exception ex) { ex.printStackTrace()}
            try {
                def outputDirPath = "src/main/resources/output/"
                def outputDir = new File(outputDirPath)
                // clean output directory to avoid past results messing up current ones
                FileUtils.cleanDirectory(outputDir)
                filePaths = MyExprTest.executeQuery(query, domain)  //need to pass outputDir and numData
                                                                    //also need to omit use or assignment of filePaths
                // get all the files created by executing the query - all tables in output
                outputDir.eachFileRecurse (FileType.FILES) { file ->
                    outputFilesList << file.toString().replaceAll(outputDirPath, "")
                }
                defaultTable = outputFilesList.get(0).toString() // or use some other logic to determine defaultTable
                CSVReader csvReader = new CSVReader(new FileReader(outputDirPath+defaultTable))
                //CSVReader csvReader = new CSVReader(new FileReader(filePaths.get(0).toString()))

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
        [domain: domain, defaultQuery: defaultQuery, defaultNumData: defaultNumData, fieldNames: fieldNames,
         tableData: allEntries.toArray(), tableNameList: outputFilesList, defaultTable: defaultTable]
    }

    def query_output() {
        render(file: filePaths.get(0).toString(), contentType: 'text/csv', fileName: "query_output.csv")
    }
}
