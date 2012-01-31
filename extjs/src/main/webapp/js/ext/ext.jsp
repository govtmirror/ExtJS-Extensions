
<%
    String debug = Boolean.parseBoolean(request.getParameter("debug-qualifier")) ? "-debug" : "";
%>
<link rel="stylesheet" type="text/css" href="${param['relPath']}js/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="${param['relPath']}js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${param['relPath']}js/ext/ext-all<%= debug %>.js"></script>