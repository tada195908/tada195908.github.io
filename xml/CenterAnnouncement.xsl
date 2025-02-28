<?xml version="1.0" encoding="ISO-2022-JP"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>
  <xsl:template match="/CenterAnnouncement">
      <html>
      <head>
        <title><xsl:value-of select="JapaneseDocument/Title" /></title>
      </head>

      <body>
      <div align="right"><xsl:value-of select="Year" />年
                         <xsl:value-of select="Month" />月
<!--                         <xsl:value-of select="Date" />日-->
      </div>
      <div><xsl:value-of select="JapaneseDocument/To" /></div>
      <div align="right"><xsl:apply-templates select="JapaneseDocument/From" /></div>
      <h1 align="center"><xsl:apply-templates select="JapaneseDocument/Title" /></h1>
      <hr />
      <xsl:choose>
        <xsl:when test="JapaneseDocument/MainText/Section">
          <xsl:for-each select="JapaneseDocument/MainText/Section">
            <h2>
              <xsl:number count="Section" level="multiple" />.<xsl:text> </xsl:text>
              <xsl:if test="Title">
                <xsl:apply-templates select="Title"/>
              </xsl:if>
            </h2>
            <div><xsl:apply-templates select="Text"/></div>
            <xsl:for-each select="Subsection">
              <h3>
                <xsl:number count="Section" level="multiple" /><xsl:text>.</xsl:text>
                <xsl:number count="Subsection" level="multiple" />.<xsl:text> </xsl:text>
                <xsl:if test="Title">
                  <xsl:apply-templates select="Title"/>
                </xsl:if>
              </h3>
              <div><xsl:apply-templates select="Text"/></div>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="JapaneseDocument/MainText" />
        </xsl:otherwise>
      </xsl:choose>
      </body>
      </html>
    </xsl:template>

    <xsl:template match="tt">
      <tt><xsl:apply-templates /></tt>
    </xsl:template>
    <xsl:template match="i">
      <i><xsl:apply-templates /></i>
    </xsl:template>
    <xsl:template match="b">
      <b><xsl:apply-templates /></b>
    </xsl:template>

    <xsl:template match="pre">
      <xsl:copy-of select="."/>
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

    <!-- 表 -->    
    <xsl:template match="Table">
      <xsl:if test="string-length(@Label)>0">
        <xsl:element name="a">
          <xsl:attribute name="name"><xsl:value-of select="@Label" />
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
      <table border="1" align="center">
        <tr><xsl:copy-of select="TableHeader/*" /></tr>
        <xsl:copy-of select="TableBody/*" />
      </table>
    </xsl:template>

    <!-- 図 -->
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

  <xsl:template match="Input">
    <p>
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="@file" />
          <xsl:text>.html</xsl:text>
        </xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </p>
  </xsl:template>
  
</xsl:stylesheet>
