<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}" type="image/x-icon">
<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
<style>
body,
input, select, textarea {
    font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}
html,
body {
    margin:0;
    padding:0;
    height:100%;
}
#wrapper {
    min-height:100%;
    position:relative;
}
#header {
}
#content {
    padding-bottom:50px;   /* Height of the footer element */
}
#footer {
    background: #4b2b61;
    color: #ece5f3;
    font-size: 0.8em;
    padding: 18px;
    width:100%;
    height:50px;
    position:absolute;
    bottom:0;
    left:0;
}

.nav {
    background-color: #efefef;
    padding: 0.5em 0.75em;
    -moz-box-shadow: 0 0 3px 1px #aaaaaa;
    -webkit-box-shadow: 0 0 3px 1px #aaaaaa;
    box-shadow: 0 0 3px 1px #aaaaaa;
    zoom: 1;
}

.nav ul {
    overflow: hidden;
    padding-left: 0;
    zoom: 1;
}

.nav li {
    display: block;
    float: left;
    list-style-type: none;
    margin-right: 0.5em;
    padding: 0;
}

.nav a {
    color: #666666;
    display: block;
    padding: 0.25em 0.7em;
    text-decoration: none;
    -moz-border-radius: 0.3em;
    -webkit-border-radius: 0.3em;
    border-radius: 0.3em;
}

.nav a:active, .nav a:visited {
    color: #666666;
}

.nav a:focus, .nav a:hover {
    background-color: #999999;
    color: #ffffff;
    outline: none;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
}

.no-borderradius .nav a:focus, .no-borderradius .nav a:hover {
    background-color: transparent;
    color: #444444;
    text-decoration: underline;
}

.nav a.home, .nav a.list, .nav a.create {
    background-position: 0.7em center;
    background-repeat: no-repeat;
    text-indent: 25px;
}

.nav a.home {
    background-image: url(../images/skin/house.png);
}

.nav a.list {
    background-image: url(../images/skin/database_table.png);
}

.nav a.create {
    background-image: url(../images/skin/database_add.png);
}

/* CREATE/EDIT FORMS AND SHOW PAGES */

fieldset,
.property-list {
    margin: 0.6em 1.25em 0 1.25em;
    padding: 0.3em 1.8em 1.25em;
    position: relative;
    zoom: 1;
    border: none;
}

.property-list .fieldcontain {
    list-style: none;
    overflow: hidden;
    zoom: 1;
}

.fieldcontain {
    margin-top: 1em;
}

.fieldcontain label,
.fieldcontain .property-label {
    color: #666666;
    text-align: right;
    width: 25%;
}

.fieldcontain .property-label {
    float: left;
}

.fieldcontain .property-value {
    display: block;
    margin-left: 27%;
}

label {
    cursor: pointer;
    display: inline-block;
    margin: 0 0.25em 0 0;
}

input, select, textarea {
    background-color: #fcfcfc;
    border: 1px solid #cccccc;
    font-size: 1em;
    padding: 0.2em 0.4em;
}

select {
    padding: 0.2em 0.2em 0.2em 0;
}

select[multiple] {
    vertical-align: top;
}

textarea {
    width: 250px;
    height: 150px;
    overflow: auto; /* IE always renders vertical scrollbar without this */
    vertical-align: top;
}

input[type=checkbox], input[type=radio] {
    background-color: transparent;
    border: 0;
    padding: 0;
}

input:focus, select:focus, textarea:focus {
    background-color: #ffffff;
    border: 1px solid #eeeeee;
    outline: 0;
    -moz-box-shadow: 0 0 0.5em #ffffff;
    -webkit-box-shadow: 0 0 0.5em #ffffff;
    box-shadow: 0 0 0.5em #ffffff;
}

.required-indicator {
    color: #48802C;
    display: inline-block;
    font-weight: bold;
    margin-left: 0.3em;
    position: relative;
    top: 0.1em;
}

ul.one-to-many {
    display: inline-block;
    list-style-position: inside;
    vertical-align: top;
}

.ie6 ul.one-to-many, .ie7 ul.one-to-many {
    display: inline;
    zoom: 1;
}

ul.one-to-many li.add {
    list-style-type: none;
}

/* EMBEDDED PROPERTIES */

fieldset.embedded {
    background-color: transparent;
    border: 1px solid #CCCCCC;
    margin-left: 0;
    margin-right: 0;
    padding-left: 0;
    padding-right: 0;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
}

fieldset.embedded legend {
    margin: 0 1em;
}

/* MESSAGES AND ERRORS */

.errors,
.message {
    font-size: 0.8em;
    line-height: 2;
    margin: 1em 2em;
    padding: 0.25em;
}

.message {
    background: #f3f3ff;
    border: 1px solid #b2d1ff;
    color: #006dba;
    -moz-box-shadow: 0 0 0.25em #b2d1ff;
    -webkit-box-shadow: 0 0 0.25em #b2d1ff;
    box-shadow: 0 0 0.25em #b2d1ff;
}

.errors {
    background: #fff3f3;
    border: 1px solid #ffaaaa;
    color: #cc0000;
    -moz-box-shadow: 0 0 0.25em #ff8888;
    -webkit-box-shadow: 0 0 0.25em #ff8888;
    box-shadow: 0 0 0.25em #ff8888;
}

.errors ul,
.message {
    padding: 0;
}

.errors li {
    list-style: none;
    background: transparent url(../images/skin/exclamation.png) 0.5em 50% no-repeat;
    text-indent: 2.2em;
}

.message {
    background: transparent url(../images/skin/information.png) 0.5em 50% no-repeat;
    text-indent: 2.2em;
}

/* form fields with errors */

.error input, .error select, .error textarea {
    background: #fff3f3;
    border-color: #ffaaaa;
    color: #cc0000;
}

.error input:focus, .error select:focus, .error textarea:focus {
    -moz-box-shadow: 0 0 0.5em #ffaaaa;
    -webkit-box-shadow: 0 0 0.5em #ffaaaa;
    box-shadow: 0 0 0.5em #ffaaaa;
}

/* same effects for browsers that support HTML5 client-side validation (these have to be specified separately or IE will ignore the entire rule) */

input:invalid, select:invalid, textarea:invalid {
    background: #fff3f3;
    border-color: #ffaaaa;
    color: #cc0000;
}

input:invalid:focus, select:invalid:focus, textarea:invalid:focus {
    -moz-box-shadow: 0 0 0.5em #ffaaaa;
    -webkit-box-shadow: 0 0 0.5em #ffaaaa;
    box-shadow: 0 0 0.5em #ffaaaa;
}

/* TABLES */

table {
    border-top: 1px solid #DFDFDF;
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 1em;
}

tr {
    border: 0;
}

tr > td:first-child, tr > th:first-child {
    padding-left: 1.25em;
}

tr > td:last-child, tr > th:last-child {
    padding-right: 1.25em;
}

td, th {
    line-height: 1.5em;
    padding: 0.5em 0.6em;
    text-align: left;
    vertical-align: top;
}

th {
    background-color: #efefef;
    background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea');
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
    color: #666666;
    font-weight: bold;
    line-height: 1.7em;
    padding: 0.2em 0.6em;
}

thead th {
    white-space: nowrap;
}

th a {
    display: block;
    text-decoration: none;
}

th a:link, th a:visited {
    color: #666666;
}

th a:hover, th a:focus {
    color: #333333;
}

th.sortable a {
    background-position: right;
    background-repeat: no-repeat;
    padding-right: 1.1em;
}

th.asc a {
    background-image: url(../images/skin/sorted_asc.gif);
}

th.desc a {
    background-image: url(../images/skin/sorted_desc.gif);
}

.odd {
    background: #f7f7f7;
}

.even {
    background: #ffffff;
}

th:hover, tr:hover {
    background: #E1F2B6;
}

/* PAGINATION */

.pagination {
    border-top: 0;
    margin: 0;
    padding: 0.3em 0.2em;
    text-align: center;
    -moz-box-shadow: 0 0 3px 1px #AAAAAA;
    -webkit-box-shadow: 0 0 3px 1px #AAAAAA;
    box-shadow: 0 0 3px 1px #AAAAAA;
    background-color: #EFEFEF;
}

.pagination a,
.pagination .currentStep {
    color: #666666;
    display: inline-block;
    margin: 0 0.1em;
    padding: 0.25em 0.7em;
    text-decoration: none;
    -moz-border-radius: 0.3em;
    -webkit-border-radius: 0.3em;
    border-radius: 0.3em;
}

.pagination a:hover, .pagination a:focus,
.pagination .currentStep {
    background-color: #999999;
    color: #ffffff;
    outline: none;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
}

.no-borderradius .pagination a:hover, .no-borderradius .pagination a:focus,
.no-borderradius .pagination .currentStep {
    background-color: transparent;
    color: #444444;
    text-decoration: underline;
}

/* ACTION BUTTONS */

.buttons {
    background-color: #efefef;
    overflow: hidden;
    padding: 0.3em;
    -moz-box-shadow: 0 0 3px 1px #aaaaaa;
    -webkit-box-shadow: 0 0 3px 1px #aaaaaa;
    box-shadow: 0 0 3px 1px #aaaaaa;
    margin: 0.1em 0 0 0;
    border: none;
}

.buttons input,
.buttons a {
    background-color: transparent;
    border: 0;
    color: #666666;
    cursor: pointer;
    display: inline-block;
    margin: 0 0.25em 0;
    overflow: visible;
    padding: 0.25em 0.7em;
    text-decoration: none;

    -moz-border-radius: 0.3em;
    -webkit-border-radius: 0.3em;
    border-radius: 0.3em;
}

.buttons input:hover, .buttons input:focus,
.buttons a:hover, .buttons a:focus {
    background-color: #999999;
    color: #ffffff;
    outline: none;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
}

.no-borderradius .buttons input:hover, .no-borderradius .buttons input:focus,
.no-borderradius .buttons a:hover, .no-borderradius .buttons a:focus {
    background-color: transparent;
    color: #444444;
    text-decoration: underline;
}

.buttons .delete, .buttons .edit, .buttons .save {
    background-position: 0.7em center;
    background-repeat: no-repeat;
    text-indent: 25px;
}

.ie6 .buttons input.delete, .ie6 .buttons input.edit, .ie6 .buttons input.save,
.ie7 .buttons input.delete, .ie7 .buttons input.edit, .ie7 .buttons input.save {
    padding-left: 36px;
}

.buttons .delete {
    background-image: url(../images/skin/database_delete.png);
}

.buttons .edit {
    background-image: url(../images/skin/database_edit.png);
}

.buttons .save {
    background-image: url(../images/skin/database_save.png);
}

a.skip {
    position: absolute;
    left: -9999px;
}

/* Navbar classes from bootstrap.css */
.navbar {
    position: relative;
    min-height: 50px;
    margin-bottom: 20px;
    border: 1px solid transparent;
}

@media (min-width: 768px) {
    .navbar {
        border-radius: 4px;
    }
}

.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

.nav > li {
    position: relative;
    display: block;
}

.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 15px;
}

.nav > li > a:hover,
.nav > li > a:focus {
    text-decoration: none;
    background-color: #eee;
}

.nav > li.disabled > a {
    color: #777;
}

.nav > li.disabled > a:hover,
.nav > li.disabled > a:focus {
    color: #777;
    text-decoration: none;
    cursor: not-allowed;
    background-color: transparent;
}

.nav .open > a,
.nav .open > a:hover,
.nav .open > a:focus {
    background-color: #eee;
    border-color: #337ab7;
}

.nav .nav-divider {
    height: 1px;
    margin: 9px 0;
    overflow: hidden;
    background-color: #e5e5e5;
}

.nav > li > a > img {
    max-width: none;
}

</style>

<g:layoutHead/>
</head>

<body style="background-image: url(images/bgimage.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;">
<div id="wrapper">
    <div id="header">
        <div id="tdgLogo" role="banner" style="padding: 20px;background-color: #4b2b61;">
            <asset:image src="banner-logo.png" alt="Test Data Generator"
                         style="height:60px; !important"/>
        </div>
        <nav class="navbar">
            <div>
                <div>
                    <ul class="nav">
                        <li id="nav-home"><a href="/TestDataGenerator101/">Home</a></li>
                        <li id="nav-domainconf"><a href="/TestDataGenerator101/domainConf/add">Domain Configuration</a></li>
                        <li id="nav-queryexec"><a href="/TestDataGenerator101/domainSelection/select">Query Execution</a></li>
                        <li id="nav-datablind"><a href="#">Data Blinding</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div id="content">
        <g:layoutBody/>
    </div>
    <div id="footer">
        <div class="footer" role="contentinfo">
            Deerwalk Services Pvt. Ltd.
        </div>
    </div>
</div>
</body>
</html>
