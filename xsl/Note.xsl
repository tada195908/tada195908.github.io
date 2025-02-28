<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://aoba.cc.saga-u.ac.jp/ns /Document.xsd"
xmlns:own="http://aoba.cc.saga-u.ac.jp/ns"
xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
>
  <xsl:output method="html" encoding="UTF-8" version="4.01"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="own:Note">
    <html>
      <head>
        <link rel="stylesheet" href="Note.css"/>
        <title><xsl:apply-templates select="own:Title"/></title>
      </head>
      <body>
        <h1><xsl:apply-templates select="own:Title"/></h1>
        <div align="right">
          <xsl:value-of select="own:Date"/><br/>
          <xsl:apply-templates select="own:Author"/><br/>
          <xsl:apply-templates select="own:Address"/><br/>
        </div>
        <hr />
        <xsl:for-each select="own:Section">
          <xsl:if test="Title">
            <h2><xsl:apply-templates select="own:Title"/></h2>
          </xsl:if>
          <div><xsl:apply-templates select="own:Text"/></div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>


  <!-- Figure -->
  <xsl:template match="own:Figure">
    <xsl:choose>
    <xsl:when test="own:img/@width>400">
      <xsl:element name="table">
        <xsl:attribute name="align">center</xsl:attribute>
        <xsl:attribute name="border">0</xsl:attribute>
      <tr><td align="center"><xsl:apply-templates select="own:img"/></td></tr>
      <tr><td align="center"><xsl:apply-templates select="own:Caption"/></td></tr>
      </xsl:element>
    </xsl:when>
    <xsl:otherwise>
      <xsl:element name="table">
        <xsl:attribute name="align">right</xsl:attribute>
        <xsl:attribute name="border">0</xsl:attribute>
      <tr><td align="center"><xsl:apply-templates select="own:img"/></td></tr>
      <tr><td align="center"><xsl:apply-templates select="own:Caption"/></td></tr>
      </xsl:element>
    </xsl:otherwise>
    
    </xsl:choose>
  </xsl:template>

  <!-- Structures -->
  <xsl:template match="own:ul">
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  
  <xsl:template match="own:ol">
    <ol>
      <xsl:apply-templates />
    </ol>
  </xsl:template>
  
  <xsl:template match="own:li">
    <li><xsl:apply-templates /></li>
  </xsl:template>

  <xsl:template match="own:p">
    <p><xsl:apply-templates /></p>
  </xsl:template>

  <xsl:template match="own:br">
    <br />
  </xsl:template>

  <xsl:template match="own:a">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href" />
      </xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  
  <!-- Font Faces -->
  <xsl:template match="own:tt">
    <tt><xsl:apply-templates /></tt>
  </xsl:template>
  
  <xsl:template match="own:i">
    <i><xsl:apply-templates /></i>
  </xsl:template>
  
  <xsl:template match="own:b">
    <b><xsl:apply-templates /></b>
  </xsl:template>

  <xsl:template match="own:img">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@src"/>
      </xsl:attribute>
      <xsl:attribute name="width">
        <xsl:value-of select="@width"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>


</xsl:stylesheet>
