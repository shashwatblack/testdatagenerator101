<%--
  Created by IntelliJ IDEA.
  User: shashwat
  Date: 7/30/15
  Time: 9:30 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Resource Manager</title>

    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../css/AdminLTE.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../web-plugins/jquery-ui-themes-1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="../web-plugins/elfinder/css/elfinder.min.css">

    %{--<script src="../js/jquery-1.6.2.min.js"></script>--}%
    <script src="../js/jquery-2.1.3.min.js"></script>
    <script>
        // for elfinder exception. as .browser was deprecated in jQuery 1.9
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();
    </script>
    <script src="../js/bootstrap.min.js"></script>

    <script src="../web-plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../web-plugins/elfinder/js/elfinder.min.js"></script>

    %{-- For Elfinder Resources --}%
    %{--<r:require modules="elfinder" />--}%
    %{--<r:require modules="elfinder, elfinder-theme" />--}%

    %{--<elfinder:init id="elfinder" controller="elfinderConnector" />--}%
    %{-- ~~~~~~~~~~~~~~~~~~~~~~ --}%


    <style>
    .ui-widget-content {
        background: #eee;
    }
    </style>
</head>

<body>
<script type="text/javascript" charset="utf-8">
    options = {
        url: '${g.createLink(controller:'elfinderConnector')}',  // connector URL (REQUIRED)
        height: $(window).height() - 209
    };

    $(document).ready(function () {
        var elfinder = $('#elfinder').elfinder(options).elfinder('instance');

        // hide elfinder backlink because I'm evil
        $("div[title='About this software']").parent().hide();

        //nav bar update
        $('#nav-resourcemanager').css({'background-color': '#d2d2d2', '-webkit-border-radius': '0.3em', 'border-radius': '0.3em'});

    });

    //    $(window).resize(function(){
    //        console.log('resized');
    //        var win_height = $(window).height()-209;
    //        var elfinder = $('#elfinder');
    //        if( elfinder.height() != win_height ){
    //            elfinder.height(win_height).resize();
    //        }
    //    });

</script>

<!-- Element where elFinder will be created (REQUIRED) -->
<div id="elfinder" style="margin-top: -19px"></div>
</body>
</html>