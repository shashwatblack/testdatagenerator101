<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 5/25/15
  Time: 10:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
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

        });
    </script>

</head>

<body style="background-image: url(../images/bgimage.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;">

<div  style="min-height: 100%; min-height: 100vh; display: flex; align-items: center; margin:0px">
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
            <button type="button" class="btn btn-primary btn-lg" style="width:10px 0%" name="nextButton" onclick="nextButtonClicked()">
                Next
            </button>
        </div>
    </div>
</div>
</div>
</body>
</html>