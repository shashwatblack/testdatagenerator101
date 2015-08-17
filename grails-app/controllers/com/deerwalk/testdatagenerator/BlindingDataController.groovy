package com.deerwalk.testdatagenerator

import np.com.shashwatblack.datablinder.BatchBlinder

class BlindingDataController {

    def index(){
        redirect(action: 'blind')
    }

    def allowedMethods = []

    def blind() {
        def fileResourceInstance
        def f = new File( "src/main/resources/blinder/input" )
        if( f.exists() ){
            f.eachFile(){ file->
                if( !file.isDirectory() )
                    fileResourceInstance = file.name
            }
        }
        def fileContent = new File("src/main/resources/blinder/jsonFormat/BlinderLogic.json").text

        def outputContent = new File("src/main/resources/blinder/output/OutputFile.csv").text

        [ fileResourceInstance: fileResourceInstance, fileContent: fileContent, outputContent: outputContent ]
    }


    def functionBlind(){
        BatchBlinder bct = new BatchBlinder("src/main/resources/blinder/input/inputFile.csv", "src/main/resources/blinder/jsonFormat/BlinderLogic.json","src/main/resources/blinder/output/OutputFile.csv" );
        bct.run();
        redirect(action: "blind")
    }

    def deleteUploadFile(){
        def filename = params.filename
        def file = new File( "src/main/resources/blinder/input/" + filename )
        file.delete()
        flash.message = "file ${filename} removed"
        redirect(action: "blind")
    }

    def upload() {
        def f = request.getFile('fileUpload')
        if(!f.empty) {
            flash.message = 'Your file has been uploaded'
            new File( grailsApplication.config.images.location.toString() ).mkdirs()
            f.transferTo( new File( "src/main/resources/blinder/input/inputFile.csv" ) )
//            f.transferTo( new File( "src/Upload/" + f.getOriginalFilename() ) )
        }
        else {
            flash.message = 'file cannot be empty'
        }
        redirect (action:"blind")
    }

    def download() {
        def fileName = "src/main/resources/blinder/output/OutputFile.csv"
        try{
            render(file:fileName, contentType: "text/csv", fileName: "output")

        }
        catch(Exception e)
        {
            render("file not found")
//                redirect(action: 'blind')
        }

    }

    def update(String stringToUpdate){
        flash.message = 'i am called'
        new File("src/main/resources/blinder/jsonFormat/BlinderLogic.json").write(stringToUpdate)
        redirect(action: 'blind')
    }

}
