$(document).ready(function () {
    $("#tableList > option").each(function () {
        console.log(this.text);
        var resultTable = $("#resultTable_" + this.text);
        if (resultTable) {
            resultTable.DataTable();
            $("<a href='../queryExecution/query_output.csv?fileName=" + this.text + "'>" +
                "<img id='save_icon' alt='Download' title='Download all as csv'/>" +
                "</a>").insertAfter("#resultTable_" + this.text + "_next");

            resultTable.on('draw.dt', function () {
                $("<a href='../queryExecution/query_output.csv?fileName=" + this.text + "'>" +
                    "<img id='save_icon' alt='Download' title='Download all as csv'/>" +
                    "</a>").insertAfter("#resultTable_" + this.text + "_next");
            });
            $('#tableNameListDiv').show();
        }
    });
    //show only one table
    updateShowingTable()

    //show dropdown list upon table drawing complete
    $("#tableNameListDiv").change(function (event) {
        selectedTableChanged(event)
    });

    //make select tags beautiful
    $('.selectpicker').selectpicker();

    //nav-element active
    $('#nav-queryexec').css({'background-color': '#d2d2d2','-webkit-border-radius': '0.3em','border-radius': '0.3em'});

});

function updateShowingTable() {
    var selectedTable = ($("#tableNameListDiv option:selected").text());
    $("#tableList > option").each(function () {
        var resultTable = $("#resultTable_" + this.text + "_wrapper");
        if (this.text == selectedTable) {
            resultTable.show();
        } else {
            resultTable.hide();
        }
    });

}

function selectedTableChanged(event) {
    updateShowingTable();
}
