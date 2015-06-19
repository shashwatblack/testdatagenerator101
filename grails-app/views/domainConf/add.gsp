<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 6/19/15
  Time: 12:13 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Domain Configuration</title>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/domainConfAddCustom.css" type="text/css" rel="stylesheet">

    <script src="../js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript">
        function selectButtonClicked() {
            //some code here
        }
    </script>

</head>

<body style="background-image: url(../images/bgimage.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;">

<div  style="min-height: 100%; min-height: 100vh; margin-top:40px">
    <div class="container" style="width: 100%">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-2 col-md-5 col-md-offset-1
                    col-sm-5 col-xs-10 col-xs-offset-1" align="center">
                <div class="input-group" style="width:90%">
                    <g:select class="input-sm" style="width:100%; text-indent:0%" name="domainList" id="domainList" from="${domainNameList}" value="${defaultDomain}" />
                </div>
            </div>
            <div class="col-lg-4 col-md-5
                    col-sm-5 col-xs-10 col-xs-offset-1 selectButtonDiv" align="center">
                <button type="button" class="btn btn-primary btn-sm" style="width:90%" name="selectButton" onclick="selectButtonClicked()">
                    Select
                </button>
            </div>
        </div>

    </div>
</div>
</body>
</html>