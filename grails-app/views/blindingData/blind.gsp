<%--
  Created by IntelliJ IDEA.
  User: dipesh
  Date: 8/17/15
  Time: 1:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="base"/>
    <title>Blinding Data</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/bootstrap-select.min.css" type="text/css" rel="stylesheet">
    <link href="../css/AdminLTE.css" type="text/css" rel="stylesheet">
    <link href="../css/domainConfAddCustom.css" type="text/css" rel="stylesheet">
    <link href="../web-plugins/iCheck/skins/square/blue.css" type="text/css" rel="stylesheet">
    <link href="../web-plugins/toastr/toastr.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <script src="../web-plugins/iCheck/icheck.js"></script>
    <script src="../web-plugins/toastr/toastr.js"></script>
    <script src="../js/custom.js"></script>

    //this is hide and show function.
    <script>
        $(document).ready(function(){
            $("#blindingForm").show();
            $("#blindingTable").hide();

            $("#uploadFile").click(function(){
                $("#blindingForm").hide();
                $("#blindingTable").show();
            });

            $("#deleteFile").click(function(){
                $("#blindingForm").show();
                $("#blindingTable").hide();
            });
        });
    </script>
</head>

<body>
<div id="page-body" style="min-height: 70%; margin-top:30px; margin-bottom:15px;">
<div class="container" style="width: 60%; margin-left: 15%">

    <label>Upload File</label>

    <g:form method="post" id="bliindingForm" enctype="multipart/form-data">
        <div class="dialog">
            <table class="table table-bordered" style="border-width: 3px; border-bottom-color: dodgerblue; border-top-color: dodgerblue ">
                <tbody>
                <tr class="prop">
                    <td valign="top" class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
                        <input type="file" id="fileUpload" name="fileUpload" />
                    </td>
                    <td>
                        <g:actionSubmit class="btn btn-primary" id="uploadFile" value="UPLOAD" action="upload"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </g:form>

    <div class="message">${flash.message}</div>
    <div id="success"></div>

    <div class="box box-primary" id="blindingTable">
        <label>Data to blind</label>
        <table class="table table-bordered">

            <thead>
            <tr>
                <th>FileName</th>
                <th>Blinging Logic</th>
                <th>Blind Data</th>
                <th>Download</th>
                <th>Delete</th>
                %{--<g:sortableColumn property="query" title="Query"/>--}%
            </tr>
            </thead>

            <tbody>
            <g:if test="${fileResourceInstance != null}">
                %{--<g:while test="${i < fileResourceInstance.size()}">--}%
                    <tr>
                        <td style="width: 20%">${fileResourceInstance}</td>
                        <td style="width: 20%"><button type="button" class="btn btn-primary glyphicon-pencil" style="width:75%; margin-right: 3%;" data-toggle="modal" data-target="#myModal"> VIEW </button></td>
                        <td style="width: 20%"><button type="button" class="btn btn-success glyphicon glyphicon-thumbs-up" style="width:75%; margin-right: 3%;"><g:link action="functionBlind" params='[fileName:"${fileResourceInstance}"]'><font color="white">  BLIND  </font></g:link></button></td>
                        <td style="width: 20%"><button type="button" class="btn btn-warning glyphicon-download" style="width:75%; margin-right: 3%;"><g:link action="download" params='[fileName:"${fileResourceInstance}"]' ><font color="white">OUTPUT</font></g:link></button></td>
                        <td style="width: 20%"><button type="button" class="btn btn-danger glyphicon-remove" id="deleteFile" style="width:75%; margin-right: 3%;"><g:link action="deleteUploadFile"  params='[fileName:"${fileResourceInstance}"]' ><font color="white"> DELETE </font></g:link></button></td>
                    </tr>
                    %{--<% i++ %>--}%
                %{--</g:while>--}%
            </g:if>
            </tbody>
        </table>
    </div>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Blinding Logic</h4>
            </div>
            <div class="modal-body" >
                <textarea class="form-control" rows="20" id="textMessage">${blindingContent}</textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="editedMoadlInButton" onclick="updateFunction('${fileResourceInstance}')">Update</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<script>
    function updateFunction(inputFileName) {
        var stringToUpdate = $('#textMessage').val();
        $.ajax({
            type: 'POST',
            url: '/TestDataGenerator101/BlindingData/update',
            data: {stringToUpdate: stringToUpdate, inputFileName: inputFileName},
            success: (function (response) {
                if (response == 'false') {
                    //alert('Something\'s wrong.')
                    toastr.error("Something's not quite right.");
                } else {
                    //alert('Domain file successfully edited.');
                    toastr.success("Domain file edited.");
                    //location.reload();
                }
            }),
            error: (function () {
                //alert('Some error occurred. Cannot execute ajax call.')
                toastr.error("Some error occurred. Cannot execute ajax call.");
            })
        });
        $('#myModal').modal('hide');
    }

</script>
</div>
</body>
</html>