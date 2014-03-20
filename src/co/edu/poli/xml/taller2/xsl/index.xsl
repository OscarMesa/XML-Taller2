<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : index.xsl
    Created on : March 10, 2014, 10:48 AM
    Author     : oskar
    Description:
        Index del proyecto.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Página Personal</title>
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
               
                <div>
                    <table width="90%">
                        <tbody>
                            <tr>
                                <td>
                                    <img src="../publico/images/{//curriculum/infoPersona/FotoPerfil}"></img>
                                </td>
                                <td class="centrado">
                                    <h2>&lt;
                                        <xsl:value-of select="//curriculum/infoPersona/nombreApellidos"/>&gt;
                                    </h2>
                                    <br/>
                                    <p>
                                        <a href="mailto:{//curriculum/infoPersona/correoElectronico}">
                                            <img height="37" alt="Correo Electrónico" src="../publico/images/mailgifa3.gif"/> 
                                    &lt;
                                            <xsl:value-of select="//curriculum/infoPersona/correoElectronico"/>&gt;
                                        </a>
                                        <br/>
                                    </p>
                                    <a href="{//curriculum/infoPersona/intitucion/@link}" target="_blank">&lt;
                                        <xsl:value-of select="//curriculum/infoPersona/intitucion/text()"/>&gt;
                                    </a> 
                                    <br/>
                                    <br/>
                                    <h4>&lt;
                                        <xsl:value-of select="//curriculum/infoPersona/direccion"/>&gt;
                                    </h4>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            
                    <p class="centrado">
                        <a href="{//menu/item/@link}">
                            <xsl:value-of select="//menu/item/text()"/>
                        </a>
                        <xsl:for-each select="//menu/item">
                            <xsl:if test="position() &gt; 1">
                                | <a href="{@link}">
                                    <xsl:value-of select="text()"/>
                                </a> 
                            </xsl:if>
                        </xsl:for-each>
                    </p>
                    <hr/>
                </div>
                <h4>
                    <xsl:value-of select="//noticias/@titulo"/>
                </h4>
                <table>
                    <tbody>
                        <xsl:for-each select="//noticias/noticia">
                            <tr>
                                <td class="centrado">
                                    <img src="../publico/images/{imagen}"/>
                                </td>
                                <td>
                                    <xsl:value-of select="descripcion"/>
                                    <a href="{linkDetalle}" target="_blank">[Detalles]
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <h4>
                    <xsl:value-of select="//referencias/@titulo"/>
                </h4>
                <small>
                    <table>
                        <tbody>
                            <xsl:for-each select="//referencias/referencia">
                                <tr>
                                    <td>
                                        <xsl:value-of select="tituloRef"/>
                                        <a href="{hiperLink/@link}" target="_blank"><xsl:value-of select="hiperLink/text()"/></a>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </small>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

