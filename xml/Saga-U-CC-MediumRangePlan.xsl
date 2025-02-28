<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- 中期目標中期計画 -->
<!-- 2004/9/29 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
  version="1.0">

  <xsl:output method="html" encoding="ISO-2022-JP" />
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:MediumRangePlan">
    <html>
      <head>
        <title>
          <xsl:apply-templates select="Title"/>
          <xsl:text>(</xsl:text>
          <xsl:value-of select="Title/@range"/>
          <xsl:text>)</xsl:text>
        </title>
        <xsl:choose>
          <xsl:when test="link/@href">
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
            <link rel="stylesheet" href="../../MediumRangePlan.css"/>
          </xsl:otherwise>
        </xsl:choose>
      </head>

      <body>
        <h1>
          <xsl:apply-templates select="Title"/>
          <xsl:text>(</xsl:text>
          <xsl:value-of select="Title/@range"/>
          <xsl:text>)</xsl:text>
        </h1>
        <hr/>
        <table border="1">
          <tr><th>中期目標</th><th>中期計画</th><th>年度計画</th></tr>
          <xsl:for-each select="Part">
            <tr>
              <td colspan="3">
                <h2>
                  <xsl:value-of select="@number"/><xsl:text>. </xsl:text>
                  <xsl:apply-templates select="Title"/>
                </h2>
              </td>
            </tr>
            <xsl:for-each select="Chapter">
              <tr>
                <td colspan="3">
                  <h3>
                    <xsl:value-of select="@number"/><xsl:text>. </xsl:text>
                    <xsl:apply-templates select="Title"/><br/>
                    <!--
                         <xsl:apply-templates select="Subtitle"/>
                    -->
                  </h3>
                </td>
              </tr>
              <xsl:for-each select="Section">
                <xsl:if test='@number'>
                  <tr>
                    <td colspan="3">
                      <h4>
                        (<xsl:value-of select="@number"/>)
                        <xsl:apply-templates select="Title"/><br/>
                        <!--
                             <xsl:apply-templates select="Subtitle"/>
                             -->
                      </h4>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:for-each select="Subsection">
                  <tr>
                    <td>
                      <h5><xsl:apply-templates select="Title"/></h5>
                      <xsl:apply-templates select="Description"/>
                    </td>
                    <td>
                      <h5><xsl:apply-templates select="Subtitle"/></h5>
                      <xsl:apply-templates select="Subdescription"/>
                    </td>
                    <td>
                      <xsl:apply-templates select="Text"/>
                    </td>
                  </tr>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>
      </table>
      </body>
    </html>
  </xsl:template>


  <!-- Font Faces -->
  <xsl:template match="tt">
    <tt><xsl:apply-templates /></tt>
  </xsl:template>
  <xsl:template match="i">
    <i><xsl:apply-templates /></i>
  </xsl:template>
  <xsl:template match="b">
    <b><xsl:apply-templates /></b>
  </xsl:template>

  <!-- Text Structures -->
  <xsl:template match="p">
    <p><xsl:apply-templates /></p>
  </xsl:template>
  <xsl:template match="div">
    <div><xsl:apply-templates /></div>
  </xsl:template>
  <xsl:template match="br">
    <br />
  </xsl:template>
  <xsl:template match="ul">
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  <xsl:template match="ol">
    <xsl:element name="ol">
      <xsl:attribute name="type">
        <xsl:value-of select="@type"/>
      </xsl:attribute>
      <xsl:attribute name="start">
        <xsl:value-of select="@start"/>
      </xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
  <xsl:template match="dl">
    <dl>
      <xsl:apply-templates />
    </dl>
  </xsl:template>
  <xsl:template match="li">
    <xsl:element name="li">
      <xsl:attribute name="type">
        <xsl:value-of select="@type"/>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select="@value"/>
      </xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
  <xsl:template match="dd">
    <dd><xsl:apply-templates /></dd>
  </xsl:template>
  <xsl:template match="dt">
    <dt><xsl:apply-templates /></dt>
  </xsl:template>
  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
