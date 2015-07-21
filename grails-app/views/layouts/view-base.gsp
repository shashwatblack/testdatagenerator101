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

    .nav>li>a:focus, .nav>li>a:hover {
        background-color: #D2D2D2; !important;
    }
    .nav a:focus, .nav a:hover {
        background-color: #D2D2D2; !important;
        color: #444;
        text-shadow: 0 0 0 rgba(0, 0, 0, 0);
    }

    .nav a:active, .nav a:visited {
        color: #666666;
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
    .footer > p > a {
        color: #ece5f3;
        text-decoration: underline;
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
            <p style="float: left">
                Deerwalk Services Pvt. Ltd.
            </p>
            <p style="float: right">
                <a href="https://github.com/shashwatblack/testdatagenerator101/issues" target="_blank">Bug reports, Feature requests, and more.</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
