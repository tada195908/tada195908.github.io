<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- $B%;%s%?!<?M;vMQ(BXSL -->
<!-- 2004/5/6$B:n@.(B -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
  version="1.0">

  <xsl:output method="html" encoding="ISO-2022-JP" />
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:Personnel">
    <html>
      <head>
        <title><xsl:value-of select="Title" /></title>
      </head>

      <body bgcolor="#FFFFFF">
        <div align="left"><xsl:value-of select="ToAddress" /></div>
        <div align="right"><xsl:value-of select="Date" /></div>
        <div align="right"><xsl:value-of select="FromAddress" /></div>
        <h1 align="center"><xsl:value-of select="Title" /></h1>
        <div>
          <xsl:apply-templates select="MainText/Opening"/>
        </div>
        <div align="center">$B5-(B</div>
        <table border="1">
          <xsl:for-each select="MainText/Terms/Term">
            <tr>
              <td><xsl:apply-templates select="Name"/></td>
              <td><xsl:apply-templates select="Text"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- $BK\J8Fb$N=q<0@_Dj(B -->
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

  <xsl:template match="quote">
    <div align="center">
      <xsl:apply-templates />
    </div>
  </xsl:template>
  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


</xsl:stylesheet>
