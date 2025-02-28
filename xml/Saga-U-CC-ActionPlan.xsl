<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- 中期目標中期計画アクションプラン -->
<!-- 2004/9/25 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
  version="1.0">

  <xsl:output method="html" encoding="ISO-2022-JP" />
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:ActionPlan">
    <html>
      <head>
        <title>
        	<xsl:if test="Title/@ocode='5120'">学術情報処理センター</xsl:if>
        	<xsl:if test="Title/@ocode='6160'">データベース統合会議</xsl:if>
        	年度計画
        	<xsl:value-of select="Title/@code"/>
        </title>
      </head>

      <body bgcolor="#FFFFFF">
        <h3 align="left">
        	<xsl:if test="Title/@ocode='5120'">学術情報処理センター</xsl:if>
        	<xsl:if test="Title/@ocode='6160'">データベース統合会議</xsl:if>
        	年度計画
        	<xsl:value-of select="Title/@code"/>
        </h3>
        <h2>
        	<xsl:apply-templates select="Title"/>
        </h2>
        <hr/>
	        <xsl:apply-templates select="SectionDescription"/>
        <hr/>
        <xsl:for-each select="Annual">
        	<h3><xsl:value-of select="@Year"/>/<xsl:value-of select="@Month"/>:
        	    達成度<xsl:value-of select="@level"/>
        	</h3>
        	<xsl:apply-templates select="Text"/>
        	<hr/>
        </xsl:for-each>
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

</xsl:stylesheet>        
        	
        
       
  
