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

//alert("fuk")
$(document).ready(function() {
    // initialize fields counter to 1
    var fieldCounter = 1;
    addfieldBox(fieldCounter);

    $("#add-field").click(function() {
        fieldCounter++;
        addfieldBox(fieldCounter);
    });
    $("#remove-field").click(function() {
        removefieldBox(fieldCounter);
        fieldCounter--;
    });

});

function addfieldBox(fc) {
    var fieldBoxTemplate = $('#field-box-template').html();
    fieldBoxTemplate = fieldBoxTemplate.replace(/\@/g, fc);
    $(fieldBoxTemplate).insertBefore("#my-box-footer");
    activatePlugins();
    attachSelectPickerChangeEvent(fc);
    //enable remove-field button if more than one field is there
    if(fc > 1) {
        $("#remove-field").attr("disabled", false);
    }
}

function removefieldBox(fc) {
    $("#field-box" + fc).remove();
    //disable remove-field button if only one field remains
    if(fc == 2) {
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

    $("#field-data-type" + sno).change(function(event) {
        //alert($(event.target.id).value());

        var selectedType = ($("#field-data-type" + sno + " option:selected").text());
        if (selectedType == 'String') {
            $("#range-group" + sno).addClass("invisible");
            $("#source-group" + sno).removeClass("invisible");

        } else {
            $("#range-group" + sno).removeClass("invisible");
            $("#source-group" + sno).addClass("invisible");

        }

    });
}
