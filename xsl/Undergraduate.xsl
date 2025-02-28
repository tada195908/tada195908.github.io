<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://aoba.cc.saga-u.ac.jp/ns Undergraduate.xsd"
    xmlns:own="http://aoba.cc.saga-u.ac.jp/ns"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8" version="4.01"/>

  <xsl:template match="own:Undergraduate">
    <html>
      <head>
        <title>Undergraduate Research Project:<xsl:value-of select="own:Year" /></title>
        <link rel="stylesheet" href="/base.css"/>
      </head>
      <body>
        <h1 align="center"><xsl:value-of select="own:Year" />年度卒業研究</h1>
        <hr />
        <xsl:if test="own:Texts">
          <h2>輪講</h2>
          <xsl:apply-templates select="own:Texts/own:Text"/>
          <ul>
            <xsl:for-each select="own:Texts/own:RefItem">
              <li><xsl:apply-templates/></li>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <h2 align="left">卒業研究課題</h2>
        <div align="right"><xsl:value-of select="own:Version" /></div>
        <hr />
        <dl>
          <xsl:for-each select="own:Project">
            <dt><xsl:value-of select="own:ProjectTitle" /></dt>
            <dd>
              <xsl:apply-templates select="own:ProjectDescription" />
              <xsl:if test="own:References">
                <ul>
                  <xsl:for-each select="own:References/own:RefItem">
                    <li><xsl:apply-templates/></li>
                  </xsl:for-each>
                </ul>
              </xsl:if>
            </dd>
          </xsl:for-each>
        </dl>
        <hr />
        <xsl:if test="own:Schedule">
          <h2 align="left">スケジュール</h2>
          <table align="center" border="1">
            <tr><th>時期</th><th>内容</th></tr>
            <xsl:for-each select="own:Schedule/own:Term">
              <tr>
                <td><xsl:apply-templates select="own:Period"/></td>
                <td><xsl:apply-templates select="own:Target"/></td>
              </tr>
            </xsl:for-each>
          </table>
          <hr />
        </xsl:if>
        <xsl:if test="own:Diary">
          <h2 align="left">セミナー日誌</h2>
          <table align="center" border="1">
            <tr><th>日付</th><th>内容</th></tr>
            <xsl:for-each select="own:Diary/own:DiaryEntry">
              <tr>
                <td>
                  <xsl:value-of select="own:Date/@Year"/>/<xsl:value-of select="own:Date/@Month"/>/<xsl:value-of select="own:Date/@Day"/>
                </td>
                <td><xsl:apply-templates select="own:Text"/></td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>

        <xsl:if test="own:Links">
          <hr/>
          <h2 align="left">リンク</h2>
          <ul>
            <xsl:for-each select="own:Links/own:RefItem">
              <li><xsl:apply-templates/></li>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <a href="/UndergraduateResearchProject.html">卒業研究テーマトップへ</a>
      </body>
    </html>
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
  
  <!-- Text Structures -->
  <xsl:template match="own:p">
    <p><xsl:apply-templates /></p>
  </xsl:template>
  <xsl:template match="own:br">
    <br />
  </xsl:template>
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
  <xsl:template match="own:dl">
    <dl>
      <xsl:apply-templates />
    </dl>
  </xsl:template>
  <xsl:template match="own:li">
    <li><xsl:apply-templates /></li>
  </xsl:template>
  <xsl:template match="own:dd">
    <dd><xsl:apply-templates /></dd>
  </xsl:template>
  <xsl:template match="own:dt">
    <dt><xsl:apply-templates /></dt>
  </xsl:template>

  <!-- HyperLinks -->
  <xsl:template match="own:a">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href" />
      </xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>
