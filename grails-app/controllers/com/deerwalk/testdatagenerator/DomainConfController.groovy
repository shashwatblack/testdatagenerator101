package com.deerwalk.testdatagenerator

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonElement
import com.google.gson.JsonParser
import com.major.antlrTest.domainConfiguration.Utils
import grails.converters.JSON
import groovy.io.FileType
import org.json.simple.JSONArray
import org.json.simple.JSONObject
import org.json.simple.parser.JSONParser

class DomainConfController {

    def TABLESOURCEDIRPATH = "src/main/resources/input/table/"
    def FIELDSOURCEDIRPATH = "src/main/resources/input/field/"
    def index() {
        redirect(action: 'add', params:[saveSuccess: "false"])
    }

    def add(String saveSuccess) {
        Utils utils = new Utils()
        List<String> domainNameList = utils.domainNameList
        //////////////////////
        def inputDir = new File(FIELDSOURCEDIRPATH)
        List<String> fieldSourceFiles = new ArrayList<>();
        if(!inputDir.exists()) inputDir.mkdirs()
        inputDir.eachFileRecurse (FileType.FILES) { file ->
            // read current file in iteration
            // if file is hidden, continue
            if (!file.isHidden()) {
                fieldSourceFiles.add(file.name)
            }
        }
        inputDir = new File(TABLESOURCEDIRPATH)
        if(!inputDir.exists()) inputDir.mkdirs()
        List<String> tableSourceFiles = new ArrayList<>();
        inputDir.eachFileRecurse (FileType.FILES) { file ->
            // read current file in iteration
            // if file is hidden, continue
            if (!file.isHidden()) {
                tableSourceFiles.add(file.name)
            }
        }

        //////////////////////
        [domainNameList: domainNameList, defaultDomain: domainNameList[0],
         saveSuccess: saveSuccess, tableSourceFiles: tableSourceFiles, fieldSourceFiles: fieldSourceFiles]
    }

    def addNewDomain(String domainName, String outputDelimiter) {
        domainName = 'src/main/resources/domain_config/' + domainName
        boolean success = new File(domainName).createNewFile()
        if (success) {
            // write an empty json array to initialize the file.
            FileWriter fileWriter = new FileWriter(domainName)
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("output_delimiter", outputDelimiter)
            jsonObject.put("tables", new JSONArray());

            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String uglyJSON = jsonObject.toJSONString();
            JsonParser jp = new JsonParser();
            JsonElement je = jp.parse(uglyJSON);
            String prettyJSON = gson.toJson(je);
            fileWriter.write(prettyJSON)
            fileWriter.flush()
            fileWriter.close()
        }
        render { [response: success] } as JSON
    }

    def deleteDomain(String domainName) {
        domainName = 'src/main/resources/domain_config/' + domainName
        boolean success = new File(domainName).delete()
        render { [response: success] } as JSON
    }

    def saveEditedDomain(String domainName, String editedText) {
        domainName = 'src/main/resources/domain_config/' + domainName
        boolean success
        try {
            FileWriter fileWriter = new FileWriter(domainName)
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            JsonParser jp = new JsonParser();
            JsonElement je = jp.parse(editedText);
            String prettyJSON = gson.toJson(je);
            fileWriter.write(prettyJSON)
            fileWriter.flush()
            fileWriter.close()
            success = true;
        } catch (Exception ex) {
            success = false;
        }
        render { [response: success] } as JSON
    }

    def fetchDomain(String domainName) {
        domainName = 'src/main/resources/domain_config/' + domainName
        String contents = new File(domainName).text
        render contents
    }

    def saveDomainConf() {
        if (!params.containsKey("domainList")) return
        String selectedDomain = params.get("domainList")
        JSONParser jsonParser = new JSONParser()
        String saveSuccess
        try {
            JSONObject domainObject = (JSONObject) jsonParser.parse(new FileReader("src/main/resources/domain_config/" + selectedDomain + ".json"))
            JSONArray jsonArray = (JSONArray) domainObject.get("tables")
            JSONObject newObject = new JSONObject()

            newObject.put("name", params.get("table-name"));
            newObject.put("dependency", params.get("dependency-table"));

            JSONObject table_source = new JSONObject();
            table_source.put("path", TABLESOURCEDIRPATH + params.get("source-csv-path"));
            table_source.put("delimiter", params.get("source-csv-delimiter"));
            newObject.put("source", table_source);

            JSONArray fields = new JSONArray();

            int fieldCounter = 1
            while (1) {
                if (params.containsKey("field-name" + fieldCounter)) {
                    JSONObject field = new JSONObject();
                    field.put("field_name", params.get("field-name" + fieldCounter))
                    field.put("type", params.get("field-data-type" + fieldCounter))

                    if (params.get("field-data-type" + fieldCounter) == "string") {
                        JSONObject sourceObject = new JSONObject()
                        if (params.get("source-type"+fieldCounter) == "path")
                            sourceObject.put(params.get("source-type" + fieldCounter), FIELDSOURCEDIRPATH + params.get("source" + fieldCounter))
                        else
                            sourceObject.put(params.get("source-type" + fieldCounter), params.get("source" + fieldCounter))
                        field.put("source", sourceObject)
                    }
                    else if (params.get("field-data-type" + fieldCounter) == "date") {
                        field.put("lower_range", params.get("date-range-begin" + fieldCounter))
                        field.put("upper_range", params.get("date-range-end" + fieldCounter))
                        field.put("date_format", params.get("date-range-format" + fieldCounter))
                    }
                    else {
                        field.put("lower_range", params.get("range-begin" + fieldCounter))
                        field.put("upper_range", params.get("range-end" + fieldCounter))
                    }

                    if (params.containsKey("chk-unique" + fieldCounter))
                        field.put("unique", "true")
                    if (params.containsKey("chk-autoincrement" + fieldCounter))
                        field.put("autoincrement", "true")
                    fields.add(field)
                    fieldCounter++
                } else {
                    break
                }
            }
            newObject.put("fields", fields)

            //append new table to current domain tables
            jsonArray.add(newObject);
            //append jsonArray to existing domain data
            domainObject.put("tables", jsonArray);
            //write domainObject back to file
            FileWriter fileWriter = new FileWriter("src/main/resources/domain_config/" + selectedDomain + ".json")
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String uglyJSON = domainObject.toJSONString();
            JsonParser jp = new JsonParser();
            JsonElement je = jp.parse(uglyJSON);
            String prettyJSON = gson.toJson(je);
            fileWriter.write(prettyJSON)
            fileWriter.flush()
            fileWriter.close()
            saveSuccess = "saved"

        } catch (Exception ex) {
            ex.printStackTrace()
            saveSuccess = "error"
        }
        redirect(action: 'add', params: [saveSuccess: saveSuccess])
    }

}
