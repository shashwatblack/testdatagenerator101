$(document).ready(function () {
    var resultTable = $("#resultTable");
    if (resultTable.length) {
        resultTable.DataTable();
        $('#tableNameListDiv').show();
        $("#tableNameListDiv").change(function(event) { tableNameChanged(event) });
    }
    $("<a href='../queryExecution/query_output.csv'>" +
        "<img id='save_icon' alt='Download' title='Download all as csv'/>" +
        "</a>").insertAfter("#resultTable_next");
    $('.selectpicker').selectpicker();

    resultTable.on('draw.dt', function () {
        $("<a href='../queryExecution/query_output.csv'>" +
            "<img id='save_icon' alt='Download' title='Download all as csv'/>" +
            "</a>").insertAfter("#resultTable_next");
    });
});

function tableNameChanged(event) {
    //alert($(event.target.id).value());

    var selectedType = ($("#tableNameListDiv option:selected").text());
    alert(selectedType);
    // now ajaxx

}

function addDomainButtonClicked() {
    var newDomainName = prompt("Please enter the new Domain Name", "new_domain");
    if (newDomainName != null) {
        newDomainName = newDomainName + ".json";
        $.ajax({
            type: 'POST',
            url: '/TestDataGenerator101/domainConf/addNewDomain',
            data: {newDomainName: newDomainName},
            success: (function (response) {
                if (response == 'false') {
                    alert('File already exists.')
                } else {
                    alert('File successfully created.')
                }
            }),
            error: (function () {
                alert('Some error occurred. Cannot execute ajax call.')
            })
        });

    }
}