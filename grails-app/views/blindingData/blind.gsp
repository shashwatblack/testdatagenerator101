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
    <link href="../plugins/iCheck/skins/square/blue.css" type="text/css" rel="stylesheet">
    <link href="../plugins/toastr/toastr.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <script src="../plugins/iCheck/icheck.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>
    <script src="../js/custom.js"></script>
</head>

<body>
<div id="page-body" style="min-height: 70%; margin-top:30px; margin-bottom:15px;">
<div class="container" style="width: 60%; margin-left: 15%">

    <label>Upload File</label>

    <g:form method="post"  enctype="multipart/form-data">
        <div class="dialog">
            <table class="table table-bordered" style="border-width: 3px; border-bottom-color: dodgerblue; border-top-color: dodgerblue ">
                <tbody>
                <tr class="prop">
                    <td valign="top" class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
                        <input type="file" id="fileUpload" name="fileUpload" />
                    </td>
                    <td>
                        <g:actionSubmit class="btn btn-primary" value="UPLOAD" action="upload"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </g:form>

    <div class="message">${flash.message}</div>
    <div id="success"></div>

    <div class="container" >
        <label>Data to blind</label>
        <table class="table table-bordered" style="border-width: 3px; border-bottom-color: dodgerblue; border-top-color: dodgerblue ">

            <thead>
            <tr>
                <th>fileName</th>
                <th>fileSource</th>
                <th>Delete Option</th>
                %{--<g:sortableColumn property="query" title="Query"/>--}%
            </tr>
            </thead>

            <tbody>
            <g:if test="${fileResourceInstance != null}">
                <tr>
                    <td>${fileResourceInstance}</td>
                    <td> /src/Upload/${fileResourceInstance}</td>
                    <td><button class="btn btn-danger glyphicon-remove"><g:link action="deleteUploadFile"  params='[filename:"${fileResourceInstance}"]' > delete </g:link></button></td>
                </tr>
            </g:if>
            </tbody>
        </table>
    </div>


    <div class="container-fluid" >
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td><button type="button" class="btn btn-success glyphicon glyphicon-thumbs-up"><g:link action="functionBlind">   BLIND   </g:link></button>
                    <!-- Trigger the modal with a button --></td>
            </tr>
            <tr> <td><button type="button" class="btn btn-primary glyphicon-pencil btn-lg" data-toggle="modal" data-target="#myModal"> View Blinder Logic </button>
                %{--<button type="button" class="btn btn-success" onclick="myFunction()">view jason file</button>--}%</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="content">
        <table class="table table-bordered" style="border-width: 3px; border-bottom-color: dodgerblue; border-top-color: dodgerblue ">
            <tbody>
            <td><label>OUTPUT FILE</label></td>
            <td><button type="button" class="btn btn-warning glyphicon-download"><g:link action="download" >Download Output</g:link></button></td>
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
            <div class="modal-body">
                <textarea class="form-control" rows="20" id="textMessage">${fileContent}</textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="editedMoadlInButton" onclick="updateFunction()">Update</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<script>
    function updateFunction() {
        var stringToUpdate = $('#textMessage').val();
        $.ajax({
            type: 'POST',
            url: '/TestDataGenerator101/BlindingData/update',
            data: {stringToUpdate: stringToUpdate},
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