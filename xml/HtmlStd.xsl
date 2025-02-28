<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="ISO-2022-JP"/>

  <!-- Structures -->
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
      <xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <!-- Style -->
  <xsl:template match="tt">
    <tt><xsl:apply-templates /></tt>
  </xsl:template>
  <xsl:template match="i">
     <i><xsl:apply-templates /></i>
  </xsl:template>
  <xsl:template match="b">
    <b><xsl:apply-templates /></b>
  </xsl:template>

  <xsl:template match="sub">
    <sub><xsl:apply-templates /></sub>
  </xsl:template>

  <xsl:template match="sup">
    <sup><xsl:apply-templates /></sup>
  </xsl:template>



</xsl:stylesheet>
