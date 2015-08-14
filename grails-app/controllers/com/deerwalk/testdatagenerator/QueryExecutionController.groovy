package com.deerwalk.testdatagenerator

import com.major.antlrTest.MyExprTest
import com.major.antlrTest.domainConfiguration.Domain
import com.major.antlrTest.domainConfiguration.MapGenerate
import com.opencsv.CSVReader
import grails.converters.JSON
import org.apache.commons.io.FileUtils

import java.nio.file.Path
import groovy.io.FileType

class QueryExecutionController {

    def List<Path> filePaths

    def outputDirPath = "src/main/resources/output/"
    def outputDir = new File(outputDirPath)


    def index() {}

    def execute(String domain, String query, String numData) {
        def defaultQuery = "table_name1.name=\"A.*\""
        def defaultNumData = 50
        def outputFilesList = []
        def defaultTable = ""

        def success = "T"
        def message = ""

        List fieldNames = [], allEntries = []
        Map allTables=[:]
        if (query != null) {
            defaultQuery = query;
            try {
                defaultNumData = Integer.parseInt(numData)
            } catch (Exception ex) { ex.printStackTrace()}
            try {
                // clean output directory to avoid past results messing up current ones
                FileUtils.cleanDirectory(outputDir)
                filePaths = MyExprTest.executeQuery(query, domain, defaultNumData)  //need to pass outputDir //(done)and numData
                                                                    //also need to omit use or assignment of filePaths
                // get all the files created by executing the query - all tables in output
                outputDir.eachFileRecurse (FileType.FILES) { file ->
                    // read current file in iteration
                    def returnedData = readCSV(file)
                    fieldNames = returnedData[0]
                    allEntries = returnedData[1]

                    // store in big array
                    def tableName = file.toString().replaceAll(outputDirPath, "").replaceAll(".csv","")
                    allTables.(tableName.toString()) = [
                            tablefields: fieldNames,
                            tabledata: allEntries.toArray()]


                    outputFilesList << tableName

                }
                defaultTable = outputFilesList.get(0).toString() // or use some other logic to determine defaultTable
                //CSVReader csvReader = new CSVReader(new FileReader(filePaths.get(0).toString()))

//                CSVReader csvReader = new CSVReader(new FileReader(outputDirPath+defaultTable))
//                allEntries = csvReader.readAll();
//                if (allEntries.size() > 0) {
//                    fieldNames = allEntries.remove((int) 0);
//                    //Title case the field names
//                    for (int i = 0; i < fieldNames.size(); i++) {
//                        fieldNames[i] = fieldNames[i].toString()[0].toUpperCase() + fieldNames[i].toString().substring(1);
//                    }
//                }
            } catch (Exception ex) {
                ex.printStackTrace();
                success = "F"
                message = ex.getMessage();
                //throw ex;
            }
        }
        [success: success, message: message, domain: domain, defaultQuery: defaultQuery, defaultNumData: defaultNumData, allTables: allTables,
         tableData: allEntries.toArray(), tableNameList: outputFilesList, defaultTable: defaultTable]
    }

    private def List readCSV(filePath) {
        //String delimeter =
        CSVReader csvReader = new CSVReader(new FileReader(filePath), "%".charAt(0))
        //CSVReader csvReader = new CSVReader(new FileReader(filePaths.get(0).toString()))
        def fieldNames = []
        def allEntries = csvReader.readAll();
        if (allEntries.size() > 0) {
            fieldNames = allEntries.remove((int) 0);
            //Title case the field names
            for (int i = 0; i < fieldNames.size(); i++) {
                fieldNames[i] = fieldNames[i].toString()[0].toUpperCase() + fieldNames[i].toString().substring(1);
            }
        }
        return [fieldNames, allEntries];
    }

    def query_output(String fileName) {
        fileName = fileName + ".csv";
        render(file: outputDirPath+fileName, contentType: 'text/csv', fileName: fileName)
    }
}
