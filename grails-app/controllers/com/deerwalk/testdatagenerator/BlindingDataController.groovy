package com.deerwalk.testdatagenerator
import np.com.shashwatblack.datablinder.BatchBlinder
import np.com.shashwatblack.datablinder.FindTypeOfData
import org.apache.commons.lang.StringUtils

class BlindingDataController {

    def index(){
        redirect(action: 'blind')
    }

    def blind() {

        def fileResourceInstance
        def blindingContent
        def outputContent

        def f = new File( "src/main/resources/blinder/input" )
        if( f.exists() ){
            f.eachFile(){ file->
                if( !file.isDirectory() ){
                    fileResourceInstance = file.name
                    def onlyFileName = StringUtils.substringBefore(fileResourceInstance, ".")
                    blindingContent = new File("src/main/resources/blinder/jsonFormat/"+onlyFileName+".json").text
                    outputContent = new File("src/main/resources/blinder/output/blinded_"+onlyFileName+".csv").text
                }
            }
        }

        [fileResourceInstance: fileResourceInstance, outputContent: outputContent, blindingContent: blindingContent ]
    }

    def upload() {
        def f = request.getFile('fileUpload')
        if(!f.empty) {
            flash.message = 'Your file has been uploaded'
            new File( grailsApplication.config.images.location.toString() ).mkdirs()
            def uploadFileName = f.getOriginalFilename()
            def locationUpload = "src/main/resources/blinder/input/"+ uploadFileName
            f.transferTo( new File( locationUpload ) )
//            f.transferTo( new File( "src/Upload/" + f.getOriginalFilename() ) )

            def onlyFileName = StringUtils.substringBefore(uploadFileName, ".")
            //update the logic
            FindTypeOfData.FindTheType(locationUpload, "src/main/resources/blinder/jsonFormat/"+onlyFileName+".json")

            //to create new output file.
            def file = new File("src/main/resources/blinder/output/blinded_"+onlyFileName+".csv")
            file.createNewFile()
        }
        else {
            flash.message = 'file cannot be empty'
        }
        redirect (action:"blind")
    }

    def update(){
        def inputFileName= params.inputFileName
        def stringToUpdate = params.stringToUpdate
        flash.message = 'i am called'
        def onlyFileName = StringUtils.substringBefore(inputFileName, ".")
        new File("src/main/resources/blinder/jsonFormat/"+onlyFileName+".json").write(stringToUpdate)
        redirect(action: 'blind')
    }

    def functionBlind(){
        def tempString = params.fileName
        def onlyFileName = StringUtils.substringBefore(tempString, ".")

        BatchBlinder bct = new BatchBlinder("src/main/resources/blinder/input/"+tempString, "src/main/resources/blinder/jsonFormat/"+onlyFileName+".json","src/main/resources/blinder/output/blinded_"+onlyFileName+".csv" );
        bct.run();
        redirect(action: "blind")
    }

    def download() {
        def tempString = params.fileName
        def onlyFileName = StringUtils.substringBefore(tempString, ".")

        def outputFile = "src/main/resources/blinder/output/blinded_"+onlyFileName+".csv"
        try{
            render(file:outputFile, contentType: "text/csv", fileName: "blinded_"+onlyFileName)
        }
        catch(Exception e)
        {
            render("file not found")
//                redirect(action: 'blind')
        }

    }

    def deleteUploadFile(){
        def filename = params.fileName
        def inputFile = new File( "src/main/resources/blinder/input/" + filename )
        inputFile.delete()

        def blindingLogicFileName = StringUtils.substringBefore(filename, ".")
        def blindingFile = new File( "src/main/resources/blinder/jsonFormat/" + blindingLogicFileName +".json" )
        blindingFile.delete()

        def outputFileName = StringUtils.substringBefore(filename, ".")
        def outputFile = new File( "src/main/resources/blinder/output/blinded_" + outputFileName + ".csv" )
        outputFile.delete()

        flash.message = "file ${filename} removed"
        redirect(action: "blind")
    }

}
