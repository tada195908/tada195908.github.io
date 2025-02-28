<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- 報告用XSL -->
<!-- Report.dtd対応 -->
<!-- 2003/9/1  作成 -->
<!-- 2004/3/2  最終変更 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/Report">
    <html>
    <head>
      <title><xsl:value-of select="Title" /></title>
    </head>

    <body>
    <div align="left"><xsl:value-of select="ToAddress" /></div>
    <div align="right"><xsl:value-of select="Date" /></div>
    <div align="right"><xsl:value-of select="Author" /></div>
    <div align="right"><xsl:value-of select="Address" /></div>
    <h1 align="center"><xsl:value-of select="Title" /></h1>
    <xsl:apply-templates select="div"/>
    <xsl:for-each select="Section">
      <h2><xsl:number count="Section" level="multiple" />.<xsl:text> </xsl:text>
          <xsl:value-of select="@Title" /></h2>
      <div><xsl:apply-templates select="Text" /></div>
      <xsl:for-each select="Subsection">
          <h3>
             <xsl:number count="Section" level="multiple" />.<xsl:number count="Subsection" level="multiple"/>.
             <xsl:value-of select="@Title" /></h3>
          <div><xsl:apply-templates select="Text" /></div>
      </xsl:for-each>
    </xsl:for-each>
    </body>
    </html>
  </xsl:template>

  <!-- 本文内の書式設定 -->
  <xsl:template match="tt">
    <tt><xsl:apply-templates /></tt>
  </xsl:template>
  <xsl:template match="i">
     <i><xsl:apply-templates /></i>
  </xsl:template>
  <xsl:template match="b">
    <b><xsl:apply-templates /></b>
  </xsl:template>
  <xsl:template match="ul">
      <ul>
    <xsl:apply-templates />
      </ul>
  </xsl:template>
  <xsl:template match="ol">
      <ol>
    <xsl:apply-templates />
      </ol>
  </xsl:template>
  <xsl:template match="li">
    <li><xsl:apply-templates /></li>
  </xsl:template>
  <xsl:template match="p">
    <p><xsl:apply-templates /></p>
  </xsl:template>
  <xsl:template match="br">
    <br />
  </xsl:template>

  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


</xsl:stylesheet>
