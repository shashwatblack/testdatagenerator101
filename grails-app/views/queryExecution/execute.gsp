<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 5/26/15
  Time: 11:50 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Query Execution</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/bootstrap-select.min.css" type="text/css" rel="stylesheet">
    <link href="../css/jquery.dataTables.css" type="text/css" rel="stylesheet">
    <link href="../plugins/toastr/toastr.css" type="text/css" rel="stylesheet">
    <link href="../css/execute_custom.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>
    <script src="../js/execute_custom.js"></script>

    <script type="text/javascript">
        function executeButtonClicked() {
            window.open('/TestDataGenerator101/queryExecution/execute?domain='
                    + document.getElementById('grailsvar_selectedDomain').innerHTML + '&query='
                    + document.getElementById('queryInput').value + '&numData='
                    + document.getElementById('numDataInput').value, '_self');
        }
    </script>
</head>

<body>
<div id="page-body" style="min-height: 70%; margin-top:40px; align-items: center;">
    <div class="container" style="width: 100%">
        <div class="row">
            <h1/>
        </div>

        <div class="row" style="margin-bottom: 20px">
            <form onsubmit="executeButtonClicked();
            return false;">
                <div class="col-lg-6 col-lg-offset-2 col-md-6 col-md-offset-2
                    col-sm-8 col-sm-offset-1 col-xs-8 col-xs-offset-1" align="center" style="padding-right: 0px">
                    <div class="input-group" style="width:100%">
                        <g:textField class="input-sm" style="width:80%; text-indent:0%"
                                     name="queryInput" id="queryInput" value="${defaultQuery}"
                                     autofocus="autofocus" onfocus="this.value = this.value;"/>
                        <g:textField class="input-sm" style="width:18%; text-indent:0%; margin-left:2%"
                                     name="numDataInput" id="numDataInput" value="${defaultNumData}" type="number"/>
                    </div>
                </div>

                <div class="col-lg-2  col-md-2
                    col-sm-2 col-xs-2" align="center">
                    <div class="input-group" style="width:100%">
                        <button type="submit" class="btn btn-primary btn-sm" style="width:100%" name="executeButton"
                                onclick="executeButtonClicked()">
                            Execute
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <div class="row" style="margin-bottom: 20px">
            <div style="display: none" id="tableNameListDiv" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2
                    col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                <g:select class='selectpicker' name='tableList' id='tableList' from='${tableNameList}'
                          value='${defaultTable}'>"+
                </g:select>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2
                    col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" align="center">
                <!--button type="button" class="btn btn-primary btn-lg" style="width:100%" name="nextButton" onclick="nextButtonClicked()">
                    Next
                </button-->
                <div id="resultTables" style="margin-bottom: 40px;">
                    <g:each in="${allTables}" var="table">
                        <table class="display " id="resultTable_${table.key}" cellspacing="0" style="width:100%">
                            <thead>
                            <tr>
                                <g:each in="${table.value.getAt('tablefields')}" var="fieldName">
                                    <th>${fieldName}</th>
                                </g:each>
                            </tr>
                            </thead>

                            <tfoot>
                            <tr>
                                <g:each in="${table.value.getAt("tablefields")}" var="fieldName">
                                    <th>${fieldName}</th>
                                </g:each>
                            </tr>
                            </tfoot>

                            <tbody>
                            <g:each in="${table.value.getAt("tabledata")}" var="record">
                                <tr>
                                    <g:each in="${record}" var="fieldValue">
                                        <td>${fieldValue}</td>
                                    </g:each>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </g:each>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Clumsy workaround for accessing grails variables in javascript -->
<div style="display: none">
    <span id="grailsvar_selectedDomain">${domain}</span>
    <span id="grailsvar_success">${success}</span>
    <span id="grailsvar_message">${message}</span>
</div>
<!-- I'm not proud of this :( -->
</body>
</html>

