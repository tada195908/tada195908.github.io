<?xml version="1.0" encoding="ISO-2022-JP"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>

  <xsl:template match="/Jarticle">
    <html>
      <head>
        <title><xsl:value-of select="Title"/></title>
        <xsl:choose>
          <xsl:when test="link/@href!='/base.css'">
            <xsl:element name="link">
              <xsl:attribute name="rel">
                <xsl:value-of select="link/@rel" />
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="link/@href" />
              </xsl:attribute>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <link rel="stylesheet" href="/base.css"/>
          </xsl:otherwise>
        </xsl:choose>
      </head>

      <body>
        <h1><xsl:apply-templates select="Title"/></h1>
        <div align="center"><xsl:apply-templates select="Subtitle"/></div>
        <div align="right"><xsl:apply-templates select="Author"/></div>
        <xsl:if test="Date">
          <div align="right"><xsl:apply-templates select="Date"/></div>
        </xsl:if>
        <hr />
      <xsl:for-each select="Section">
        <h2>
          <xsl:number count="Section" level="multiple" />
          <xsl:text>. </xsl:text>
          <xsl:value-of select="@Title" />
        </h2>
        <xsl:apply-templates select="div" />
        <xsl:for-each select="Subsection">
          <h3>
            <xsl:number count="Section" level="multiple" />
            <xsl:text>.</xsl:text>
            <xsl:number count="Subsection" level="multiple"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="@Title" />
          </h3>
          <xsl:apply-templates select="div" />
        </xsl:for-each>
      </xsl:for-each>
      <xsl:apply-templates select="div" />


      <hr/>
      <a href="/index.html">トップへ戻る</a>
      <hr/>
      <div>
        <xsl:value-of select="Author"/><br/>
        <xsl:value-of select="Author/@Institute"/><br/>
        <xsl:if test="Author/@Email">
          <xsl:text>E-mail:</xsl:text>
          <xsl:value-of select="Author/@Email"/>
        </xsl:if>
        <xsl:if test="Author/@EmailImg">
          <xsl:text>E-mail:</xsl:text>
          <xsl:element name="img">
            <xsl:attribute name="src">
              <xsl:value-of select="Author/@EmailImg" />
            </xsl:attribute>
          </xsl:element>
        </xsl:if>
      </div>
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

  <xsl:template match="applet">
    <xsl:element name="applet">
      <xsl:attribute name="archive">
        <xsl:value-of select="@archive"/>
      </xsl:attribute>
      <xsl:attribute name="code">
        <xsl:value-of select="@code"/>
      </xsl:attribute>
      <xsl:attribute name="width">
        <xsl:value-of select="@width"/>
      </xsl:attribute>
      <xsl:attribute name="height">
        <xsl:value-of select="@height"/>
      </xsl:attribute>
      <xsl:for-each select="param">
        <xsl:copy-of select="."/>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <!-- HTMLとLaTeXで違うエスケープ -->
  <xsl:template match="escape">
    <xsl:apply-templates />
  </xsl:template>

  <!-- ログのような内容の一覧 -->
  <xsl:template match="Log">
    <table border="1" align="center">
      <tr><th>日付</th><th>内容</th></tr>
      <xsl:for-each select="Record">
        <tr>
          <td><xsl:value-of select="@Date"/></td>
          <td>
            <xsl:apply-templates />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- 表 -->
  <xsl:template match="Table">
    <xsl:if test="string-length(@Label)>0">
      <xsl:element name="a">
        <xsl:attribute name="name">
          <xsl:value-of select="@Label" />
        </xsl:attribute>
      </xsl:element>
    </xsl:if>
    <table border="1" align="center">
      <tr><xsl:copy-of select="TableHeader/*" /></tr>
      <xsl:apply-templates select="TableBody/*" />
    </table>
  </xsl:template>

  <xsl:template match="td">
    <td><xsl:apply-templates /></td>
  </xsl:template>

  <xsl:template match="tr">
    <tr><xsl:apply-templates /></tr>
  </xsl:template>


  <xsl:template match="img">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@src"/>
      </xsl:attribute>
      <xsl:attribute name="width">
        <xsl:value-of select="@width"/>
      </xsl:attribute>
      <xsl:attribute name="height">
        <xsl:value-of select="@height"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>

