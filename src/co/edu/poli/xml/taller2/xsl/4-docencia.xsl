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
                <title>
                    <xsl:value-of select="//tiuloPage"/>
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
                    <b>
                        <a href="{//menu/item/@link}">
                            <xsl:value-of select="//menu/item/text()"/>
                        </a>
                        <xsl:for-each select="//menu/item">
                            <xsl:if test="position() &gt; 1">
                                | <a href="../publico/vitae/{@link}">
                                    <xsl:value-of select="text()"/>
                                </a> 
                            </xsl:if>
                        </xsl:for-each>
                    </b>
                </p>
                <br/>
                <hr color="#81245c"/>
                <br/>
                <div>
                    <a id="tutorias">
                        <h2>
                            <xsl:value-of select="//cuerpoPagina/tutorias/@titulo"/>
                        </h2>
                    </a>
                    <br/>
                    <xsl:value-of select="//cuerpoPagina/tutorias/nobreEscuela"/>
                    <br/>
                    <br/>
                    <xsl:value-of select="//cuerpoPagina/tutorias/oficina"/>
                    <br/>
                    <br/>
                    <xsl:value-of select="//cuerpoPagina/tutorias/fecha"/>v
                    <br/>
                    <br/>
                    <hr color="#81245c"/>
                    <br/>
                    
                    <a id="TFC">
                        <h2>
                            <xsl:value-of select="//cuerpoPagina/trabajo/@titulo"/>
                        </h2>
                    </a>
                    <ol>
                        <xsl:for-each select="//cuerpoPagina/trabajo/item">
                            <xsl:sort select="@year" order="descending" data-type="number"/>
                            <li>(<xsl:value-of select="@year"/>)<xsl:value-of select="text()"/></li>
                            <br/>
                        </xsl:for-each>
                    </ol>
                    
                    <xsl:for-each select="//cuerpoPagina/proyectos/proyecto">
                        <a>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@idhref"/>
                            </xsl:attribute>
                            <h2>
                                <xsl:value-of select="@titulo"/>
                            </h2>
                        </a>
                        <i>
                            <xsl:value-of select="tituloCarrera"/>
                        </i>
                        <br/>
                        <br/>
                        <big style="margin-right: 20px;">
                            <b>
                                <xsl:value-of select="presentacion/@encabezado"/>
                            </b>
                        </big>   
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="presentacion/@ubicacion"/>
                            </xsl:attribute>
                            <small>pdf</small>
                        </a>
                        <br/>
                        <br/>
                        <b>
                            <xsl:value-of select="objetivos/@encabezado"/>
                        </b>
                        <br/>
                        <br/>
                        <xsl:for-each select="objetivos/objetivo">
                            <xsl:value-of select="text()"/>
                            <br/>
                            <br/>
                        </xsl:for-each>
                        <br/>
                        <b>Temario</b>
                        <br/>
                        <br/>
                        <table border="3" rules="all">
                            <tbody>
                                <xsl:for-each select="temario/item">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="descripcion"/>
                                        </td>
                                        <xsl:if test="linkGuia">
                                            <td class="centrado">
                                                <a style="margin-left: 12px;margin-right: 12px;">
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="linkGuia"/>
                                                    </xsl:attribute>
                                                    Guía
                                                </a>
                                            </td>
                                        </xsl:if>
                                        <xsl:if test="linkEjercicios">
                                            <td class="centrado">
                                                <a style="margin-left: 12px;margin-right: 12px;">
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="linkEjercicios"/>
                                                    </xsl:attribute>
                                                    Ejercicios
                                                </a>
                                            </td>
                                        </xsl:if>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <b>Bibliografía</b>
                        <br/>
                        <br/>
                        <ul>
                            <xsl:for-each select="bibliografia/item">
                                <li>
                                    <xsl:value-of select="text()"/>
                                </li>
                                <br/>
                            </xsl:for-each>
                        </ul>
                        <xsl:apply-templates select="referencia">
                            <xsl:value-of select="referencia"/>  
                        </xsl:apply-templates>
                        <br/>
                        <br/>
                        <br/>
                        <b>Método de Evaluación</b>
                        <br/>
                        <br/>
                        <xsl:value-of select="evaluacion/node()"/>
                    </xsl:for-each>
                    <hr color="#81245c"/>
                    <br/>
                    <a>
                        <xsl:attribute name="id">
                            <xsl:value-of select="//cuerpoPagina/especialesdades/especialidad/@idhref"/>
                        </xsl:attribute>
                    </a>
                    <b><xsl:value-of select="//cuerpoPagina/especialesdades/especialidad/tipo/node()"/></b>
                    <br/>
                    <br/>
                    <br/>
                    <xsl:apply-templates select="//cuerpoPagina/especialesdades/especialidad/referencia">
                            <xsl:value-of select="//cuerpoPagina/especialesdades/especialidad/referencia"/>  
                    </xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="referencia/link">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@url"/>
            </xsl:attribute>  
            <xsl:value-of select="node()"/>
        </a>        
    </xsl:template>
    
 


</xsl:stylesheet>
   <xsl:template match="//cuerpoPagina/especialesdades/especialidad/referencia/link">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@url"/>
            </xsl:attribute>  
            <xsl:value-of select="node()"/>
        </a>        
    </xsl:template>    