<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 5/26/15
  Time: 11:50 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Domain Selection</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link  href="../css/jquery.dataTables.css" type="text/css" rel="stylesheet" >

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        function executeButtonClicked() {
            window.open('/TestDataGenerator101/queryExecution/execute?domain='
                    +document.getElementById('domainList').value, '_self')
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#resultTable').DataTable();
        })
    </script>

</head>

<body background="../images/bgimage.jpg">
<div  style="min-height: 100%; min-height: 100vh; display: flex; align-items: center; margin:0px">
    <div class="container" style="width: 100%">
        <div class="row">
            <h1 />
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-2 col-md-6 col-md-offset-2
                    col-sm-8 col-sm-offset-1 col-xs-8 col-xs-offset-1" align="center" style="padding-right: 0px">
                <div class="input-group" style="width:100%">
                    <g:textField class="input-sm" style="width:100%; text-indent:0%" name="queryInput" id="queryInput" value="${defaultQuery}" />
                </div>
            </div>
            <div class="col-lg-2  col-md-2
                    col-sm-2 col-xs-2" align="center">
                <div class="input-group" style="width:100%">
                    <button type="button" class="btn btn-primary btn-sm" style="width:100%" name="executeButton" onclick="executeButtonClicked()">
                        Execute
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <h1 />
        </div>
        <div class="row">
            <h1 />
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2
                    col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" align="center">
                <!--button type="button" class="btn btn-primary btn-lg" style="width:100%" name="nextButton" onclick="nextButtonClicked()">
                    Next
                </button-->

                <table id="resultTable" class="display" cellspacing="0" style="width:100%">
            <thead>
            <tr>
                <g:each in="${fieldNames}" var="fieldName">
                    <th>${fieldName}</th>
                </g:each>
            </tr>
            </thead>

            <tfoot>
            <tr>
                <g:each in="${fieldNames}" var="fieldName">
                    <th>${fieldName}</th>
                </g:each>
            </tr>
            </tfoot>

            <tbody>
            <g:each in="${tableData}" var="record">
                <tr>
                    <g:each in="${record}" var="fieldValue">
                        <td>${fieldValue.value}</td>
                    </g:each>
                </tr>
            </g:each>
            </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

