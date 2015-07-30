package com.deerwalk.testdatagenerator

import grails.converters.JSON

class ResourceManagerController {

    def index() {
        redirect(action: 'list', params: [path: '/'])
    }

    def list(String path) {
        // return list of all files and directories
        def fileList = []
        def folderList = []
        def f = new File("src/main/resources" + path)
        if (f.exists()) {
            f.eachFile() { file ->
                if (! file.isDirectory())
                    fileList.add([name: file.name, path: path + file.name])
            }
            f.eachDir { dir ->
                folderList.add([name: dir.name, path: path + dir.name])
            }

        }
        [fileList: fileList, folderList: folderList, path: path]
    }

    def fetchFile(String fileName) {
        fileName = 'src/main/resources' + fileName
        String contents = new File(fileName).text
        render contents
    }

    def deleteFile(String fileName) {
        fileName = 'src/main/resources/' + fileName
        boolean success = new File(fileName).delete()
        render { [response: success] } as JSON
    }

    def elfinder() {}
}


