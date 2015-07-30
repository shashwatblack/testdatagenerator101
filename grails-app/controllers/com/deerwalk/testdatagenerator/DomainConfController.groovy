package com.deerwalk.testdatagenerator

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonElement
import com.google.gson.JsonParser
import com.major.antlrTest.domainConfiguration.Utils
import grails.converters.JSON
import org.json.simple.JSONArray
import org.json.simple.JSONObject
import org.json.simple.parser.JSONParser

class DomainConfController {

    def index() {
        redirect(action: 'add')
    }

    def add() {
        Utils utils = new Utils()
        List<String> domainNameList = utils.domainNameList
        [domainNameList: domainNameList, defaultDomain: domainNameList[0]]
    }

    def addhtml() {
        render(file: "grails-app/views/domainConf/add.html", contentType: 'text/html')
    }

    def displayPOSTvariables() {
        render(params)
    }

    def addNewDomain(String domainName) {
        domainName = 'src/main/resources/domain_config/' + domainName
        boolean success = new File(domainName).createNewFile()
        if (success) {
            // write an empty json array to initialize the file.
            FileWriter fileWriter = new FileWriter(domainName)
            fileWriter.write('[]')
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
        try {
            JSONArray jsonArray = (JSONArray) jsonParser.parse(new FileReader("src/main/resources/domain_config/" + selectedDomain + ".json"))
            JSONObject newObject = new JSONObject()

            newObject.put("name", params.get("table-name"));
            newObject.put("dependency", params.get("dependency-table"));

            JSONArray fields = new JSONArray();

            int fieldCounter = 1
            while (1) {
                if (params.containsKey("field-name" + fieldCounter)) {
                    JSONObject field = new JSONObject();
                    field.put("field_name", params.get("field-name" + fieldCounter))
                    field.put("type", params.get("field-data-type" + fieldCounter))

                    if (params.get("field-data-type" + fieldCounter) == "string") {
                        JSONObject sourceObject = new JSONObject()
                        sourceObject.put(params.get("source-type" + fieldCounter), params.get("source" + fieldCounter))
                        field.put("source", sourceObject)
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

            //append new table to current domain data
            jsonArray.add(newObject);
            //write jsonArray back to file
            FileWriter fileWriter = new FileWriter("src/main/resources/domain_config/" + selectedDomain + ".json")
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String uglyJSON = jsonArray.toJSONString();
            JsonParser jp = new JsonParser();
            JsonElement je = jp.parse(uglyJSON);
            String prettyJSON = gson.toJson(je);
            fileWriter.write(prettyJSON)
            fileWriter.flush()
            fileWriter.close()

        } catch (Exception ex) {
            ex.printStackTrace()
        }
    }

}
