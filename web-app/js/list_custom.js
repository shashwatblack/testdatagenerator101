var fileToDelete = "";
var path;

$(document).ready(function () {
    var folderListTable = $("#folderListTable");
    if (folderListTable) {
        folderListTable.DataTable({
            "aaSorting": [],
            "bPaginate": false,
            "aoColumns": [
                { "bSortable": false, "sWidth": "40%"},
                { "bSortable": false, "sWidth": "40%"},
                { "bSortable": false, "sWidth": "15%" },
                { "bSortable": false, "sWidth": "15%" }
            ] });
    }
    var fileListTable = $("#fileListTable");
    if (fileListTable) {
        fileListTable.DataTable({
            "aaSorting": [],
            "bPaginate": false,
            "aoColumns": [
                { "bSortable": false, "sWidth": "40%"},
                { "bSortable": false, "sWidth": "40%"},
                { "bSortable": false, "sWidth": "15%" },
                { "bSortable": false, "sWidth": "15%" }
            ] });
        $("<div style='display:inline-block' class='pull-left'>" + path + "</div>").insertBefore("#fileListTable_filter");
    }

    //set toastr options
    toastr.options.positionClass = "toast-top-right";

    //set modal clear action upon close
    $('#viewFileModal').on('hidden.bs.modal', function (e) {
        $(this)
            .find("input,textarea,select")
            .val('')
            .end()
            .find("input[type=checkbox], input[type=radio]")
            .prop("checked", "")
            .end();
    })
});

function fetchFileData(fileName) {
    $.ajax({
        type: 'POST',
        async: false,
        url: '/TestDataGenerator101/resourceManager/fetchFile',
        data: {fileName: fileName},
        success: (function (response) {
            $('#viewFileModalTextArea').val(response)
        }),
        error: (function () {
            //alert('Some error occurred. Cannot execute ajax call.')
            toastr.error("Some error occurred. Cannot execute ajax call.");
        })
    });
}

function deleteFile(fileName) {
    $.ajax({
        type: 'POST',
        url: '/TestDataGenerator101/resourceManager/deleteFile',
        data: {fileName: fileName},
        success: (function (response) {
            if (response == 'false') {
                toastr.info("Something's not quite right.");
            } else {
                toastr.success("File successfully deleted.");
                setTimeout(function(){
                    location.reload();
                }, 500);
            }
        }),
        error: (function () {
            //alert('Some error occurred. Cannot execute ajax call.')
            toastr.error("Some error occurred. Cannot execute ajax call.");
        })
    });

}