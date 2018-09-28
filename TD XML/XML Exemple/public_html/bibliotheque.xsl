<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bibliotheque.xsl
    Created on : 7 septembre 2018, 08:51
    Author     : tmichaud
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="bibliotheque">
        <html>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="allee">
        <hr/>
        <h1> Allee <xsl:value-of select="@numero" /> </h1> 
        <hr/>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="rayon">
        <h2>Rayon <xsl:value-of select="@numero" /> </h2>
        <table>
            <tr>
                <th style="text-align: center; border: solid grey 1px; boder-collapse: collapse;">Categorie de l'ouvrage</th>
                <th style="text-align: center; border: solid grey 1px; boder-collapse: collapse;">Titre</th>
                <th style="text-align: center; border: solid grey 1px; boder-collapse: collapse;">Auteur</th>
                <th style="text-align: center; border: solid grey 1px; boder-collapse: collapse;">Numero</th>
            </tr>
            <xsl:apply-templates />
        </table> 
        <br/>
    </xsl:template>
    
    <xsl:template match="ouvrage">
        <tr>
            <td style="text-align: center; border: solid grey 1px; boder-collapse: collapse;">
                <xsl:value-of select="@type" />
            </td>
            <xsl:apply-templates />
        </tr>
    </xsl:template>
    
    <xsl:template match="titre">
        <td style="text-align: center; border: solid grey 1px; boder-collapse: collapse;" bgcolor="#fa5858">
            <xsl:value-of select="." />
        </td>
        <xsl:if test="../auteur = false()">
            <td bgcolor="000000">
                pas d'auteur
            </td>
            <xsl:if test="../numero = false()">
                <td style="text-align: center;" bgcolor="#0000">
                    pas de numero
                </td>
            </xsl:if>
        </xsl:if>        
    </xsl:template>
    
    <xsl:template match="auteur">
        <td style="text-align: center; border: solid grey 1px; boder-collapse: collapse;" bgcolor="82fa58">
            <xsl:value-of select="." />
        </td>
        <xsl:if test="../numero = false()">
            <td style="text-align: center;" bgcolor="#0000">
                pas de numero
            </td>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="numero">   
        <td style="text-align: center; border: solid grey 1px; boder-collapse: collapse;" bgcolor="819ff7">
            <xsl:value-of select="." />
        </td>
    </xsl:template>
</xsl:stylesheet>