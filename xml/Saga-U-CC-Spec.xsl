<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
                version="1.0">
  <xsl:import href="http://aoba.cc.saga-u.ac.jp/xml/HtmlStd.xsl"/>
  <xsl:output method="html" encoding="ISO-2022-JP"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:Spec">
    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-2022-JP"/>
        <link rel="stylesheet" href="ResResult.css"/>
        <title>
          <xsl:value-of select="Header/SystemName"/>
          <xsl:value-of select="Header/Title"/>
        </title>
      </head>
      <body>
        <!-- 先頭ページのみ -->
        <xsl:if test="Header/@TopPage">
          <h1><xsl:value-of select="Header/SystemName"/></h1>
          <h1><xsl:value-of select="Header/Title"/></h1>
          <h2><xsl:value-of select="Header/Date"/></h2>
          <hr/>
        </xsl:if>

        <xsl:for-each select="Body/Chapter">
          <h2><xsl:apply-templates select="Title"/></h2>

          <xsl:apply-templates select="Text"/>
          
          <xsl:for-each select="Section">
            <h3><xsl:apply-templates select="Title"/></h3>

            <xsl:apply-templates select="Text"/>
            <xsl:for-each select="SubSection">
              <h4><xsl:apply-templates select="Title"/></h4>

              <xsl:apply-templates select="Text"/>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>

        <xsl:for-each select="Body/Section">
          <h2><xsl:apply-templates select="Title"/></h2>

          <xsl:apply-templates select="Text"/>
          <xsl:for-each select="SubSection">
            <h3><xsl:apply-templates select="Title"/></h3>

            <xsl:apply-templates select="Text"/>
          </xsl:for-each>
        </xsl:for-each>

      <xsl:if test="Header/@TopDocument">
        <hr/>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="Header/@TopDocument" />
          </xsl:attribute>
        <xsl:text>トップへ戻る</xsl:text>
        </xsl:element>
      </xsl:if>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="Input">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@file"/>
        <xsl:text>.xml</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
