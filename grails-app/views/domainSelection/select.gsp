<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 5/25/15
  Time: 10:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Domain Selection</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/bootstrap-select.min.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>

    <script type="text/javascript">
        function nextButtonClicked() {
            window.open('/TestDataGenerator101/queryExecution/execute?domain='
                    +document.getElementById('domainList').value, '_self')
        };

        $(document).ready(function() {
            $('.selectpicker').selectpicker();

            $('#nav-queryexec').css({'background-color': '#d2d2d2','-webkit-border-radius': '0.3em','border-radius': '0.3em'});
        });
    </script>

</head>

<body>

<div id="page-body" style="min-height: 70%; min-height: 70vh; display: flex; align-items: center; margin:0px">
<div class="container" style="width: 100%">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3
                    col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1" align="center">
            <div class="input-group" style="width:100%">
                <g:select class="selectpicker" style="width:90%; text-indent:0%" name="domainList" id="domainList" from="${domainNameList}" value="${defaultDomain}" />
            </div>
        </div>
    </div>
    <div class="row">
        <h1 />
    </div>
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3
                    col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1" align="center">
            <button type="button" class="btn btn-primary btn-lg" style="width:100%; background-color: #25395C; border-color: #25395C;"
                    name="nextButton" onclick="nextButtonClicked()">
                Next
            </button>
        </div>
    </div>
</div>
</div>
</body>
</html>