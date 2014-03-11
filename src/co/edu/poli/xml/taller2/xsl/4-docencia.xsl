<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 4-docencia.xsl
    Created on : March 11, 2014, 9:37 AM
    Author     : omesa
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//tituloPage"/></title>
            </head>
            <body>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
