<?xml version="1.0" encoding="ISO-2022-JP"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>

  <xsl:template match="/Undergraduate">
    <html>
      <head>
        <title>Undergraduate Research Project:<xsl:value-of select="Year" /></title>
        <link rel="stylesheet" href="/base.css"/>
      </head>
      <body>
        <h1 align="center"><xsl:value-of select="Year" />$BG/EYB46H8&5f(B</h1>
        <hr />
        <xsl:if test="Texts">
          <h2>$BNX9V(B</h2>
          <xsl:apply-templates select="Texts/Text"/>
          <ul>
            <xsl:for-each select="Texts/RefItem">
              <li><xsl:apply-templates/></li>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <h2 align="left">$BB46H8&5f2]Bj(B</h2>
        <div align="right"><xsl:value-of select="Version" /></div>
        <hr />
        <dl>
          <xsl:for-each select="Project">
            <dt><xsl:value-of select="ProjectTitle" /></dt>
            <dd>
              <xsl:apply-templates select="ProjectDescription" />
              <xsl:if test="References">
                <ul>
                  <xsl:for-each select="References/RefItem">
                    <li><xsl:apply-templates/></li>
                  </xsl:for-each>
                </ul>
              </xsl:if>
            </dd>
          </xsl:for-each>
        </dl>
        <hr />
        <xsl:if test="Schedule">
          <h2 align="left">$B%9%1%8%e!<%k(B</h2>
          <table align="center" border="1">
            <tr><th>$B;~4|(B</th><th>$BFbMF(B</th></tr>
            <xsl:for-each select="Schedule/Term">
              <tr>
                <td><xsl:apply-templates select="Period"/></td>
                <td><xsl:apply-templates select="Target"/></td>
              </tr>
            </xsl:for-each>
          </table>
          <hr />
        </xsl:if>
        <xsl:if test="Diary">
          <h2 align="left">$B%;%_%J!<F|;o(B</h2>
          <table align="center" border="1">
            <tr><th>$BF|IU(B</th><th>$BFbMF(B</th></tr>
            <xsl:for-each select="Diary/DiaryEntry">
              <tr>
                <td>
                  <xsl:value-of select="Date/@Year"/>/<xsl:value-of select="Date/@Month"/>/<xsl:value-of select="Date/@Day"/>
                </td>
                <td><xsl:apply-templates select="Text"/></td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>

        <xsl:if test="Links">
          <hr/>
          <h2 align="left">$B%j%s%/(B</h2>
          <ul>
            <xsl:for-each select="Links/RefItem">
              <li><xsl:apply-templates/></li>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <a href="/UndergraduateResearchProject.html">$BB46H8&5f%F!<%^%H%C%W$X(B</a>
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
  <xsl:template match="br">
    <br />
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
  <xsl:template match="dl">
    <dl>
      <xsl:apply-templates />
    </dl>
  </xsl:template>
  <xsl:template match="li">
    <li><xsl:apply-templates /></li>
  </xsl:template>
  <xsl:template match="dd">
    <dd><xsl:apply-templates /></dd>
  </xsl:template>
  <xsl:template match="dt">
    <dt><xsl:apply-templates /></dt>
  </xsl:template>

  <!-- HyperLinks -->
  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href" />
      </xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>
