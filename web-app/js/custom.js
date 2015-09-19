// //alert("fuk")
// $(document).ready(function() {
// 	$("#dataTypes li").click(function(){

//     //sets button text
//     $("#type1").text($($(this).find("a")).text())

//     //removes isSelected class
//     $("#dataTypes li a").removeClass("isSelected");

//     //add isSlected Class to clicked element
//     $($(this).find('a')).addClass("isSelected")
// })
// });

$(document).ready(function () {
    // initialize fields counter to 1
    var fieldCounter = 1;
    addfieldBox(fieldCounter);

    $("#add-field").click(function () {
        fieldCounter++;
        addfieldBox(fieldCounter);
    });
    $("#remove-field").click(function () {
        removefieldBox(fieldCounter);
        fieldCounter--;
    });

    //nav bar update
    $('#nav-domainconf').css({'background-color': '#d2d2d2', '-webkit-border-radius': '0.3em', 'border-radius': '0.3em'});

    //validate
    /*jQuery.validator.addMethod("IsJsonString", function (value, element) {
        return this.optional(element) || (parseFloat(value) > 0);
    }, "* Text must be valid JSON.");
    $('#editDomainModalForm').validate({
        editDomainModalTextArea: {
            IsJsonString: false
        }
    });*/

    //set toastr options
    toastr.options.positionClass = "toast-top-right";
});

function addfieldBox(fc) {
    var fieldBoxTemplate = $('#field-box-template').html();
    fieldBoxTemplate = fieldBoxTemplate.replace(/\@/g, fc);
    $(fieldBoxTemplate).insertBefore("#my-box-footer");
    activatePlugins();
    attachSelectPickerChangeEvent(fc);
    //enable remove-field button if more than one field is there
    if (fc > 1) {
        $("#remove-field").attr("disabled", false);
    }
}

function removefieldBox(fc) {
    $("#field-box" + fc).remove();
    //disable remove-field button if only one field remains
    if (fc == 2) {
        $("#remove-field").attr("disabled", true);
    }
}

function activatePlugins() {
    $('.selectpicker').selectpicker();

    $(".chkbox").iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue'
    });
}

function attachSelectPickerChangeEvent(sno) {

    $("#field-data-type" + sno).change(function (event) {

        var selectedType = ($("#field-data-type" + sno + " option:selected").text());
        if (selectedType == 'String') {
            $("#range-group" + sno).addClass("invisible");
            $("#date-group" + sno).addClass("invisible");
            $("#source-group" + sno).removeClass("invisible");

            $('#chk-autoincrement' + sno).prop( "disabled", true );
            $('#chk-autoincrement-wrapper' + sno).addClass("invisible");
            $('#chk-unique' + sno).prop( "disabled", false );
            $('#chk-unique-wrapper' + sno).removeClass("invisible");

        } else if (selectedType == 'Date') {
            $("#range-group" + sno).addClass("invisible");
            $("#date-group" + sno).removeClass("invisible");
            $("#source-group" + sno).addClass("invisible");

            $('#chk-autoincrement' + sno).prop( "disabled", true );
            $('#chk-autoincrement-wrapper' + sno).addClass("invisible");
            $('#chk-unique' + sno).prop( "disabled", true );
            $('#chk-unique-wrapper' + sno).addClass("invisible");

        } else if (selectedType == 'Integer') {
            $("#range-group" + sno).removeClass("invisible");
            $("#date-group" + sno).addClass("invisible");
            $("#source-group" + sno).addClass("invisible");

            $('#chk-autoincrement' + sno).prop( "disabled", false );
            $('#chk-autoincrement-wrapper' + sno).removeClass("invisible");
            $('#chk-unique' + sno).prop( "disabled", false );
            $('#chk-unique-wrapper' + sno).removeClass("invisible");
        } else if (selectedType == 'Float') {
            $("#range-group" + sno).removeClass("invisible");
            $("#date-group" + sno).addClass("invisible");
            $("#source-group" + sno).addClass("invisible");

            $('#chk-autoincrement' + sno).prop( "disabled", true );
            $('#chk-autoincrement-wrapper' + sno).addClass("invisible");
            $('#chk-unique' + sno).prop( "disabled", true );
            $('#chk-unique-wrapper' + sno).addClass("invisible");
        }

    });

    $("#source-type" + sno).change(function (event) {

        var selectedType = ($("#source-type" + sno + " option:selected").text());
        if (selectedType == 'Path') {
            $("#source" + sno).attr("list", "fieldSourceFiles");
        } else {
            $("#source" + sno).attr("list", "");
        }

    });
//    $("#source-type" + sno).change(function (event) {
//
//        var selectedType = ($("#source-type" + sno + " option:selected").text());
//        if (selectedType == 'Path:Delimiter') {
//            $("#path-source" + sno).removeClass("invisible");
//            $("#not-path-source" + sno).addClass("invisible");
//
//        } else {
//            $("#path-source" + sno).addClass("invisible");
//            $("#not-path-source" + sno).removeClass("invisible");
//
//        }
//
//    });
}

function addDomain() {
    var newDomainName = $("#new-domain-name").val();
    if (newDomainName != "") {
        var outputDelimiter = $("#output-delimiter").val();
        newDomainName = newDomainName + ".json";
        $.ajax({
            type: 'POST',
            url: '/TestDataGenerator101/domainConf/addNewDomain',
            data: {domainName: newDomainName, outputDelimiter: outputDelimiter},
            success: (function (response) {
                if (response == 'false') {
                    //alert('Domain file already exists.')
                    toastr.info("Domain file already exists.");
                } else {
                    //alert('Domain file successfully created.');
                    toastr.success("Domain file successfully created.");
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
}

function deleteDomain() {
    var selectedDomainName = $('#domainList option:selected').text();
    selectedDomainName = selectedDomainName + ".json";
    $.ajax({
        type: 'POST',
        url: '/TestDataGenerator101/domainConf/deleteDomain',
        data: {domainName: selectedDomainName},
        success: (function (response) {
            if (response == 'false') {
                //alert('Something\'s wrong.')
                toastr.info("Something's not quite right.");
            } else {
                //alert('Domain file successfully deleted.');
                toastr.success("Domain file successfully deleted.");
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

function fetchAndPlaceDomain() {
    var selectedDomainName = $('#domainList option:selected').text();
    selectedDomainName = selectedDomainName + ".json";
    $.ajax({
        type: 'POST',
        async: false,
        url: '/TestDataGenerator101/domainConf/fetchDomain',
        data: {domainName: selectedDomainName},
        success: (function (response) {
            $('#editDomainModalTextArea').val(response)
        }),
        error: (function () {
            //alert('Some error occurred. Cannot execute ajax call.')
            toastr.error("Some error occurred. Cannot execute ajax call.");
        })
    });
}

function saveEditedDomain() {
    var selectedDomainName = $('#domainList option:selected').text();
    selectedDomainName = selectedDomainName + ".json";
    var editedText = $('#editDomainModalTextArea').val();
    if (! IsJsonString(editedText)) {
        toastr.error("The JSON format is incorrect. Check again.");
        $('#editDomainModalTextArea').tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
            .data("title", "Invalid JSON. Check again.")
            .addClass("error")
            .tooltip().focus(); // Create a new tooltip based on the error messsage we just set in the title
    } else {
        $('#editDomainModalTextArea').data("alt", "") // Clear the title - there is no error associated anymore
            .removeClass("error")
            .tooltip("destroy");
        $.ajax({
            type: 'POST',
            url: '/TestDataGenerator101/domainConf/saveEditedDomain',
            data: {domainName: selectedDomainName, editedText: editedText},
            success: (function (response) {
                if (response == 'false') {
                    //alert('Something\'s wrong.')
                    toastr.error("Something's not quite right.");
                } else {
                    //alert('Domain file successfully edited.');
                    toastr.success("Domain file edited.");
                    //location.reload();
                }
            }),
            error: (function () {
                //alert('Some error occurred. Cannot execute ajax call.')
                toastr.error("Some error occurred. Cannot execute ajax call.");
            })
        });
        $('#editDomainModal').modal('hide');
    }
}

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}
