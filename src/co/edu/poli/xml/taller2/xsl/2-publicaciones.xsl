<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 2-publicaciones.xsl
    Created on : March 11, 2014, 9:23 AM
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
                <title>
                    <xsl:value-of select="//tituloPage"/>
                </title>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                <style type="text/css">
                    BODY {MARGIN: 1cm; FONT-FAMILY: Verdana; background-color: #FFFFE8}
                    .centrado {text-align: center;}
                </style>
            </head>
            <body>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="//linkCabecera/item/@link"/>
                    </xsl:attribute>
                    <xsl:value-of select="//linkCabecera/item/text()"/>
                </a>
                <xsl:for-each select="//linkCabecera/item">
                    <xsl:if test="position() &gt; 1">
                        ==>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="@link"/>
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </a>
                    </xsl:if>
                </xsl:for-each>
                <hr color="#81245c"/>
                <br/>
                <br/>
                <br/>
                <p class="centrado">
                    <a href="{//menuDocumentos/item/@link}">
                        <xsl:value-of select="//menuDocumentos/item/text()"/>
                    </a>
                    <xsl:for-each select="//menuDocumentos/item">
                        <xsl:if test="position() &gt; 1">
                            | <a href="{@link}">
                                <xsl:value-of select="text()"/>
                            </a> 
                        </xsl:if>
                    </xsl:for-each>
                </p>
                <hr color="#81245c"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
