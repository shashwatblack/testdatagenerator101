<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="view-base"/>
    <title>Test Data Generator</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">

    <style type="text/css" media="screen">
    #page-body {
        margin-left: 20%;
        min-height: calc(100vh - 260px);
        display: flex;
        align-items: center;
        padding-bottom: 20px;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.4em;
        font-size: 1.5em;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    .nav > li > a:focus, .nav > li > a:hover {
        background-color: #D2D2D2;
    }

    .nav a:focus, .nav a:hover {
        background-color: #999999;
        color: #444;
        text-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
    }
    </style>
</head>

<body>
<!--a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
    <li>${plugin.name} - ${plugin.version}</li>
</g:each>
			</ul>
		</div-->
<div id="page-body">
    <div>
        <h1>Test Data Generator</h1>

        <p>Following are the controllers that have been built.</p>

        <div id="controller-list" role="navigation">
            <h2>Available Functionality:</h2>
            <ul>
                <li class="controller"><g:link controller="DomainConf" action="add">Domain Configuration</g:link></li>
                <li class="controller"><g:link controller="DomainSelection" action="index">Query Execution</g:link></li>
                <li class="controller"><g:link controller="BlindingData" action="index">Data Blinding</g:link></li>
                <li class="controller"><g:link controller="ResourceManager" action="index">Resource Manager</g:link></li>
            </ul>
        </div>
    </div>
</div>

<script src="js/jquery-2.1.3.min.js"></script>
<script>
    $(document).ready(function () {
        $('#nav-home').css({'background-color': '#d2d2d2', '-webkit-border-radius': '0.3em', 'border-radius': '0.3em'});
    });
</script>
</body>
</html>
