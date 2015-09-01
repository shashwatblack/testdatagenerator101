<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 7/29/15
  Time: 3:22 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Resource Manager</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/bootstrap-select.min.css" type="text/css" rel="stylesheet">
    <link href="../css/jquery.dataTables.css" type="text/css" rel="stylesheet">
    <link href="../web-plugins/toastr/toastr.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <script src="../web-plugins/toastr/toastr.js"></script>
    <script src="../js/list_custom.js"></script>
    <script>
        path = '${path}';
    </script>
    <style>
        .folder a:link{
            color:#7600d1;
        }
        .file a:link{
            color:#c56c2e;
        }
    </style>
</head>

<body>
<div id="page-body" style="min-height: 70%; margin-top:40px; align-items: center;">
    <div class="container" style="width: 100%">

        <div class="row" style="margin-bottom: 0">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2
                    col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" align="center">
                <h1 align="left">Files and Directories</h1>
            </div>
        </div>

        <div class="row" style="margin-bottom: 20px">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2
                    col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" align="center">
                <table id="fileListTable" class="display " cellspacing="0" style="width:100%">
                    <thead>
                    <tr>
                        %{--<g:sortableColumn property="folder" title="Folder"/>--}%
                        %{--<g:sortableColumn property="path" title="Path" colspan="3"/>--}%
                        <th>Name</th>
                        <th>Path</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${folderList}" status="i" var="folder">
                        <tr style="color:#7600d1;">
                            <td>${folder.getAt('name')}</td>
                            <td>${folder.getAt('path')}</td>
                            %{--<td><a href="${createLinkTo(dir: 'images', file: folder.decodeURL(), absolute: true)}"--}%
                            %{--target="_new">view</a></td>--}%
                            %{--<td><g:link action="delete" id="${folder.replace('.', '###')}"--}%
                            %{--onclick="return confirm('Are you sure?');">delete</g:link></td>--}%
                            <td>
                                %{--<a href="#" onclick="fetchFileData('${folder.getAt('path')}');--}%
                                %{--$('.fileNamePlaceholder').text('${folder.getAt('name')}');--}%
                                %{--return false;" data-toggle="modal" data-target="#viewFileModal">--}%
                                <a class="folder">
                                    Open
                                </a>
                            </td>
                            <td>
                                <a href="#" onclick="fileToDelete = '${folder.getAt('path')}';
                                $('.fileNamePlaceholder').text('${folder.getAt('name')}');
                                return false;" data-toggle="modal" data-target="#deleteFileModal">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </g:each>
                    <g:each in="${fileList}" status="i" var="file">
                        <tr style="color: #c56c2e">
                            <td>${file.getAt('name')}</td>
                            <td>${file.getAt('path')}</td>
                            %{--<td><a href="${createLinkTo(dir: 'images', file: folder.decodeURL(), absolute: true)}"--}%
                            %{--target="_new">view</a></td>--}%
                            %{--<td><g:link action="delete" id="${folder.replace('.', '###')}"--}%
                            %{--onclick="return confirm('Are you sure?');">delete</g:link></td>--}%
                            <td>
                                <a href="#" onclick="fetchFileData('${file.getAt('path')}');
                                        $('.fileNamePlaceholder').text('${file.getAt('name')}');
                                        return false;" data-toggle="modal" data-target="#viewFileModal">
                                    View
                                </a>
                            </td>
                            <td>
                                <a href="#" onclick="fileToDelete = '${file.getAt('path')}';
                                        $('.fileNamePlaceholder').text('${file.getAt('name')}');
                                        return false;" data-toggle="modal" data-target="#deleteFileModal">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~ MODALS ~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<div id="deleteFileModal" class="modal fade" role="dialog">
    <form>
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete the selected file</h4>
                </div>

                <div class="modal-body">
                    <p>Are you sure you want to delete <span class="fileNamePlaceholder"></span>?</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"
                            id="deleteFileModalYesButton"
                            onclick="deleteFile(fileToDelete)">Yes</button>
                    <button type="submit" class="btn btn-default" data-dismiss="modal">No</button>
                </div>
            </div>

        </div>
    </form>
</div>
<form>
    <div id="viewFileModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="height:90%">
            <!-- Modal content-->
            <div class="modal-content" style="height:100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">View File:  <span class="fileNamePlaceholder"></span></h4>
                </div>

                <div class="modal-body" style="height:calc(100% - 120px)">
                    <textarea id="viewFileModalTextArea" name="viewFileModalTextArea" class="input"
                              style="max-width:100%; width: 100%; height: 100%;" disabled="true"></textarea>
                </div>

                <div class="modal-footer">
                    %{--<button type="button" class="btn btn-default"--}%
                    %{--id="viewFileModalSaveButton"--}%
                    %{--onclick="saveEditedDomain();">Save</button>--}%
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>