<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:output method="text" indent="yes" encoding="EUC-JP"/>
  <xsl:strip-space elements="*"/>
  <!-- Structures -->
  <xsl:template match="ul">
    <xsl:text>
\begin{itemize}
    </xsl:text>
    <xsl:for-each select="li">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:text>
\end{itemize}
    </xsl:text>
  </xsl:template>

  <xsl:template match="ol">
    <xsl:text>
\begin{enumerate}
    </xsl:text>
    <xsl:for-each select="li">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
    <xsl:text>
\end{enumerate}
    </xsl:text>
  </xsl:template>

  <xsl:template match="li">
    <xsl:text>
\item </xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="p">
    <xsl:apply-templates />
    <xsl:text>
\par
    </xsl:text>
  </xsl:template>

  <xsl:template match="br">
    <xsl:text>\\</xsl:text>
  </xsl:template>

<!--
  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
      <xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
-->

  <!-- Style -->
  <xsl:template match="tt">
    <xsl:text>\texttt{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="i">
    <xsl:text>\textit{</xsl:text>
     <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="b">
    <xsl:text>\textbf{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="sub">
    <xsl:text>$_{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}$</xsl:text>
  </xsl:template>

  <xsl:template match="sup">
    <xsl:text>$^{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}$</xsl:text>
  </xsl:template>

</xsl:stylesheet>
