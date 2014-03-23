<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
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
                <hr color="#81245c" SIZE="2"/>
                <xsl:for-each select="//grupoInvesetigacion/grupo">
                    <br/>
                    <h3>
                        <xsl:value-of select="@titulo"/>
                    </h3>
                    <br/>
                    <SMALL>
                        <OL>
                            <xsl:for-each select="item">
                                <LI>
                                    <xsl:value-of select="text()"/>
                                </LI>
                                <br/>
                                <br/>
                            </xsl:for-each>
                        </OL>
                    </SMALL>
                    <br/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
