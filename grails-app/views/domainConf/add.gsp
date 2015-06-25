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
    <script src="../js/jquery-1.11.1.min.js"></script>
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/bootstrap-select.min.css" type="text/css" rel="stylesheet">
    <link href="../css/AdminLTE.css" type="text/css" rel="stylesheet">
    <link href="../css/domainConfAddCustom.css" type="text/css" rel="stylesheet">
    <link href="../plugins/iCheck/skins/square/blue.css" type="text/css" rel="stylesheet">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-select.min.js"></script>
    <script src="../plugins/iCheck/icheck.js"></script>
    <script src="../js/custom.js"></script>
    <script type="text/javascript">
        function selectButtonClicked() {
            //some code here
        }
    </script>
</head>

<body>
<div style="min-height: 100%; min-height: 100vh; margin-top:40px">
    <div class="container">
        <form action="saveDomainConf" method="POST">
        <div class="row" style="width:90%; margin-left:5%">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1
    col-sm-10 col-xs-10 col-xs-offset-1" style="padding: 2px">
                <div class="input-group pull-left" style="width:50%; padding-right:10px;">
                    <g:select class="selectpicker" style="width:100%; text-indent:0%" name="domainList" id="domainList" from="${domainNameList}" value="${defaultDomain}"></g:select>
                </div>
                <div class="input-group pull-right" style="width:50%; padding-left:10px;">
                    <button type="button" class="btn btn-primary" style="width:100%" name="selectButton" onclick="selectButtonClicked()">
                        Select
                    </button>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top:30px">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1
    col-sm-10 col-xs-10 col-xs-offset-1">
                <div class="box box-primary" style="width: 90%; margin-left:5%; padding:2%">
                    <div class="box-header">
                        <input class="form-control input input-lg" type="text" name="table-name" 
                               id="table-name" placeholder="table_name" style="width: 70%;"/>
                    </div>
                </div>
                <!--header box end -->
                <script id="field-box-template" type="text/my-custom-template">
                <div class="box box-primary" style="width: 90%; margin-left:5%; padding:2%" id="field-box@">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Field Name:</label>
                            <div class="input-group">
                                <input type="text" class="form-control pull-right" id="field-name@" name="field-name@" />
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <div class="form-group">
                            <label>Type:</label>
                            <div class="input-group">
                                <select class="selectpicker selectDataType" id="field-data-type@" name="field-data-type@">
                                    <option value="string">String</option>
                                    <option value="integer">Integer</option>
                                    <option value="float">Float</option>
                                    <option value="date">Date</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group invisible" id="range-group@">
                            <label>Range:</label>
                            <div class="input-group">
                                <input type="text" class="form-control pull-left" id="range-begin@" name="range-begin@" style="width: 45%" />
                                <label style="width:10%; text-align:center; margin-top:5px; font-size:initial;">-</label>
                                <input type="text" class="form-control pull-right" id="range-end@" name="range-end@" style="width: 45%" />
                            </div>
                            <!-- /.input group -->
                        </div>
                        <div class="form-group" id="source-group@">
                            <label>Source:</label>
                            <div class="input-group">
                                <input type="text" class="form-control pull-right" id="source@" name="source@" />
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                        <div class="form-group">
                            <div class="input-group">
                                <input type="checkbox" class="chkbox" id="chk-unique@" name="chk-unique@" style="margin-top: -2px">
                                <label for="chk-unique@" class="chkbox-label">Unique</label>
                                <input type="checkbox" class="chkbox" id="chk-autoincrement@" name="chk-autoincrement@">
                                <label for="chk-autoincrement@" class="chkbox-label">Autoincrement</label>
                            </div>
                            <!-- /.input group -->
                        </div>
                        <!-- /.form group -->
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- box body #@ end -->
                </script>
                <div class="box box-primary" id="my-box-footer" style="width: 90%; margin-left:5%; padding:2%">
                    <div class="box-footer">
                        <button type="button" class="btn btn-warning pull-left" id="add-field">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>&nbsp;&nbsp;Add Field</b>
                        </button>
                        <button type="button" class="btn btn-danger pull-left" id="remove-field" style="margin-left: 10px" disabled="true">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> <b>&nbsp;&nbsp;Remove Last Field</b>
                        </button>
                        <button type="submit" class="btn btn-success pull-right" id="save-domain-conf">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> <b>&nbsp;&nbsp;Save Configuration</b>
                        </button>
                    </div>
                </div>
                <!--footer box end -->
            </div>
            <!-- /column -->
        </div>
        <!-- /row -->
        </form>
    </div>
</div>
</body>

</html>