<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- $B%K%e!<%9$H>c32!!(JXSL -->
<!-- Saga-U-CC-Log.dtd$BBP1~(J -->
<!-- 2006/6/12  $B:n@.(J -->
<!-- 2006/6/12  $B:G=*JQ99(J -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp">

  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="Saga-U-CC:Log">
    <html>
    <head>
      <title><xsl:value-of select="Title" /></title>
      <link rel="stylesheet" href="/base.css" />
    </head>

    <body>
    <div align="right"><xsl:value-of select="Date" /></div>
    <div align="right"><xsl:value-of select="Author" /></div>
    <div align="right"><xsl:value-of select="Address" /></div>
    <h1 align="center"><xsl:value-of select="Title" /></h1>

  <xsl:apply-templates select="Text"/>

    <xsl:for-each select="Section">
      <h2><xsl:apply-templates select="Title" /></h2>
      <div><xsl:apply-templates select="Text" /></div>
    </xsl:for-each>
    </body>
    </html>
  </xsl:template>

  <!-- $BK\J8Fb$N=q<0@_Dj(J -->
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

  <xsl:template match="ItemList">
    <dl>
    <xsl:apply-templates />
    </dl>
  </xsl:template>

  <xsl:template match="Item">
    <dt><xsl:apply-templates select="Date"/></dt>
    <dd><xsl:apply-templates select="Text"/></dd>
  </xsl:template>

  <xsl:template match="pre">
    <pre><xsl:copy-of select="."/></pre>
  </xsl:template>

  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
      <xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>



    <xsl:template match="Figure">
      <xsl:if test="string-length(@Label)>0">
        <xsl:element name="a">
          <xsl:attribute name="name"><xsl:value-of select="@Label" />
        </xsl:attribute>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@align='center'">
      <table border="0" align="center">
        <tr><td><xsl:copy-of select="img"/></td></tr>
        <tr><td align="center"><xsl:value-of select="Caption"/></td></tr>
      </table>
    </xsl:if>
    <xsl:if test="@align='right'">
      <table border="0" align="right">
        <tr><td><xsl:copy-of select="img"/></td></tr>
        <tr><td align="center"><xsl:value-of select="Caption"/></td></tr>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="quote">
    <div align="center"><xsl:apply-templates /></div>
  </xsl:template>

  <xsl:template match="quotation">
    <div align="center"><p><xsl:apply-templates /></p></div>
  </xsl:template>

</xsl:stylesheet>
