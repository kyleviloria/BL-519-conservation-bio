<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
<xsl:template match="/">
<html>
<head>
	<META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>Error</title>
	<style>
	body {
		margin: 0px;
		padding: 0px;
		font: 90% "Lucida Grande", Lucida, Verdana, sans-serif;
	}

	div#header {
		background-color: #2c4b79;
		padding: 15px 15px 15px 20px;
		margin: 0px;
	}

	div#content{
		padding: 20px;
	}

	h2 {
		color: #fff;
		font-size: 1.3em;
		margin: 0;
		padding: 0;
	}

	div#error{
		border: 1px solid #d6d6d6;
		width: 778px;
		padding: 10px 10px;
		margin-bottom: 20px;
		background-color: #f7f7f7;
	}

	p {
		padding: 0px;
		margin: 0px;
	}

	p#error {
		color: #ce0000;
		margin-bottom: 7px;
	}

	pre {
		padding: 0px;
		margin: 0px;
		white-space: pre;
	}

	table{
		border: 1px solid #d2d2d2;
		border-spacing: 0px;
		border-collapse: collapse;
		border-bottom-color: #d2d2d2;
		width: 800px;
		background-color: #f7f7f7;
	}

	table th {
		text-align: center;
		background-color: #2c4b79;
		color: #f7f7f7;
		border-right : 1px solid #d2d2d2;
		border-bottom: 1px solid #d2d2d2;
		padding: 2px 10px 3px;
		font-style: normal;
		font-weight: normal;
		font-size: 0.9em;
	}

	table td {
		padding-right: 10px;
		padding-left: 10px;
		border-right: 1px solid #d2d2d2;
	}
	</style>
	<!--[if IE 6]>
	<style>
	div#error{
		width: 798px;
	}
	</style>
	<![endif]-->
</head>

  <body>
	<div id="header"><h2>Error in dynamic code</h2></div>
	<div id="content">
	<div id="error">

	<p id="error"><xsl:value-of select="error/contents"/></p>
	<p>Method Name: <xsl:value-of select="error/method"/></p>
    <p>Line Number: <xsl:value-of select="error/line"/></p>
    <p>Description: <xsl:value-of select="error/description"/></p>
</div>

<xsl:if test="count(error/error_stack/frame) &gt; 0">
    <table>
    <tr>
      <th align="left">Component</th>
      <th align="left">Location</th>
      <th align="left">Contents</th>
    </tr>
	<xsl:for-each select="error/error_stack/frame">
    <tr>
      <td><xsl:variable name="vComponent" select="@component"/><xsl:value-of  select="$vComponent"/></td>
      <td><xsl:variable name="vLocation" select="@location"/><xsl:value-of  select="$vLocation"/></td>
<td><pre><xsl:value-of select="."/></pre></td>
    </tr>
    </xsl:for-each>
    </table>
</xsl:if>
</div>
	</body>
  </html>
</xsl:template>
</xsl:stylesheet>