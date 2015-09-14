<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 6/19/15
  Time: 12:13 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="base"/>
    <title>Domain Configuration</title>
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
</head>

<body>
<script type="text/javascript">
    var saveSuccess = "${saveSuccess}";
    if (saveSuccess == "saved") {
        toastr.success("The table has been added in the domain successfully")
    } else if (saveSuccess == "error") {
        toastr.error("Some error occurred. Try Again.")
    } else {
//        toastr.info("Somethings are meant to remain invisible.")
    }
</script>
<div id="page-body" style="min-height: 70%; margin-top:30px; margin-bottom:15px;">
<div class="container">
<form action="saveDomainConf" method="POST">
    <div class="row" style="width:90%; margin-left:5%">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1
    col-sm-10 col-xs-10 col-xs-offset-1" style="padding: 2px">
            <div class="input-group pull-left" style="width:50%; padding-right:10px;">
                <g:select class="selectpicker" style="width:100%; text-indent:0%" name="domainList"
                          id="domainList" from="${domainNameList}" value="${defaultDomain}"></g:select>
            </div>

            <div class="input-group pull-right" style="width:50%; padding-left:10px;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editDomainModal"
                        style="width:30%; margin-right: 3%;" name="editDomainButton"
                        onclick="fetchAndPlaceDomain();
                        $('.domainNamePlaceholder').text($('#domainList option:selected').text())">
                    Edit
                </button>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteDomainModal"
                        style="width:30%; margin-right: 3%;" name="deleteDomainButton"
                        onclick="$('.domainNamePlaceholder').text($('#domainList option:selected').text())">
                    Delete
                </button>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#addDomainModal"
                        style="width:30%;" name="addDomainButton">
                    Add
                </button>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top:30px">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1
    col-sm-10 col-xs-10 col-xs-offset-1">
            <div class="box box-primary" style="width: 90%; margin-left:5%; padding:2%">
                <div class="box-header form-group" style="margin: 0">
                    <div style="width: 60%; display: inline-block;">
                        <input class="form-control input input-lg" type="text" name="table-name"
                               id="table-name" placeholder="Table Name"/>
                    </div>

                    <div style="width: 60%; display: inline-block; margin-top: 10px;">
                        <input class="form-control input" type="text" name="dependency-table"
                               id="dependency-table" placeholder="Dependency Table Name"/>
                    </div>
                    <div style="width: 60%; display: inline-block; margin-top: 10px;">
                        <input class="form-control input" type="text" name="source-csv-path"
                               id="source-csv-path" placeholder="Source CSV Path" style="width: 75%; display: inline-block;"/>
                        <input class="form-control input" type="text" name="source-csv-delimiter"
                               id="source-csv-delimiter" placeholder="Delimiter" style="width: 23%; float:right; display: inline-block;"
                               onkeypress="this.value=''"/>
                    </div>
                </div>
            </div>
            <!--header box end -->
            <script id="field-box-template" type="text/my-custom-template">
            <div class="box box-primary" style="width: 90%; margin-left:5%; padding:2%" id="field-box@">
                <div class="box-body">
                    <div class="form-group">
                        <label>Field Name:</label>
                        <div class="input-group">
                            <input type="text" class="form-control pull-right" id="field-name@"
                                   name="field-name@"/>
                        </div>
                        <!-- /.input group -->
                    </div>
                    <!-- /.form group -->
                    <div class="form-group">
                        <label>Type:</label>

                        <div class="input-group">
                            <select class="selectpicker selectDataType" id="field-data-type@"
                                    name="field-data-type@">
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
                            <input type="text" class="form-control pull-left" id="range-begin@"
                                   name="range-begin@" style="width: 45%"/>
                            <label style="width:10%; text-align:center; margin-top:5px; font-size:initial;">-</label>
                            <input type="text" class="form-control pull-right" id="range-end@" name="range-end@"
                                   style="width: 45%"/>
                        </div>
                        <!-- /.input group -->
                    </div>

                    <div class="form-group invisible" id="date-group@">
                        <div style="width:70%">
                            <label>Range:</label>
                            <label style="width: 30%;" class="pull-right">Format:</label>

                            <div class="input-group">
                                <input type="text" class="form-control" id="date-range-begin@"
                                       name="date-range-begin@" style="width: 30%"/>
                                <label style="width:5%; text-align:center; margin-top:5px; font-size:initial;">-</label>
                                <input type="text" class="form-control" id="date-range-end@" name="date-range-end@"
                                       style="width: 30%; display: inline-block; float: initial;"/>
                                <label style="width:5%; text-align:center; margin-top:5px; font-size:initial;">&nbsp;</label>
                                <input type="text" class="form-control" id="date-range-format@" name="date-range-format@"
                                       style="width: 30%; float: right" value="yyyy-dd-MM"/>
                            </div>
                        </div>
                        <!-- /.input group -->
                    </div>

                    <div class="form-group" id="source-group@">
                        <label>Source:</label>

                        <div class="input-group">
                            <div class="pull-left" style="width: 30%;">
                                <select class="selectpicker form-control" id="source-type@"
                                        name="source-type@">
                                    <option value="array">Array</option>
                                    <option value="relation">Relation</option>
                                    <option value="path">Path</option>
                                    <option value="index">Index</option>
                                </select>
                            </div>

                            <div class="pull-right" style="width: 68%;">
                                <input class="form-control" type="text" id="source@" name="source@"/>
                            </div>

                        </div>
                        <!-- /.input group -->
                    </div>
                    <!-- /.form group -->
                    <div class="form-group">
                        <div class="input-group">
                            <input type="checkbox" class="chkbox" id="chk-unique@" name="chk-unique@"
                                   style="margin-top: -2px">
                            <label for="chk-unique@" class="chkbox-label">Unique</label>
                            <input type="checkbox" class="chkbox" id="chk-autoincrement@"
                                   name="chk-autoincrement@">
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
                        <img src="../images/icons/plus-invert.png" alt="+"
                             style="height:10px; margin-bottom: 3px;"/> <b>&nbsp;&nbsp;Add Field</b>
                    </button>
                    <button type="button" class="btn btn-danger pull-left" id="remove-field"
                            style="margin-left: 10px" disabled="true">
                        <img src="../images/icons/minus-invert.png" alt="-"
                             style="width:8px; margin-bottom: 3px;"/> <b>&nbsp;&nbsp;Remove Last Field</b>
                    </button>
                    <button type="submit" class="btn btn-success pull-right" id="save-domain-conf">
                        <img src="../images/icons/save-invert.png" alt="Save"
                             style="height:10px; margin-bottom: 3px;"/> <b>&nbsp;&nbsp;Save Configuration</b>
                    </button>
                </div>
            </div>
            <!--footer box end -->
        </div>
        <!-- /column -->
    </div>
    <!-- /row -->
</form>
<!--  MODALS  -->
<!-- Add Domain Modal -->
<div id="addDomainModal" class="modal fade" role="dialog">
    <form>
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add a new Domain</h4>
                </div>

                <div class="modal-body">
                    <p>Enter the domain name (no extensions)</p>
                    <input type="text" class="form-control" id="new-domain-name" name="new-domain-name"
                           style="width: 45%" autofocus/>

                    <p></p>

                    <p>Enter the delimiter to use (for query outputs)</p>
                    <input type="text" class="form-control" id="output-delimiter" name="output-delimiter"
                           style="width: 45%" value="," onkeypress="this.value = ''"/>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-default" data-dismiss="modal"
                            id="addDomainModalCreateButton"
                            onclick="addDomain();">Create</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </form>
</div>
<!-- Delete Domain Modal -->
<div id="deleteDomainModal" class="modal fade" role="dialog">
    <form>
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete the selected domain</h4>
                </div>

                <div class="modal-body">
                    <p>Are you sure you want to delete <span class="domainNamePlaceholder"></span>?</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"
                            id="deleteDomainModalYesButton"
                            onclick="deleteDomain();">Yes</button>
                    <button type="submit" class="btn btn-default" data-dismiss="modal">No</button>
                </div>
            </div>

        </div>
    </form>
</div>
<!-- Edit Domain Modal -->
<form id="editDomainModalForm">
    <div id="editDomainModal" class="modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog" style="height:90%">
            <!-- Modal content-->
            <div class="modal-content" style="height:100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit <span class="domainNamePlaceholder"></span></h4>
                </div>

                <div class="modal-body" style="height:calc(100% - 120px)">
                    <textarea id="editDomainModalTextArea" name="editDomainModalTextArea" class="input"
                              style="max-width:100%; width: 100%; height: 100%;"></textarea>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            id="editDomainModalSaveButton"
                            onclick="saveEditedDomain();">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>
</form>
</div>
</div>
</body>

</html>
