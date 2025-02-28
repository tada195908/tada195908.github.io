<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
                version="1.0">
  <xsl:import href="http://aoba.cc.saga-u.ac.jp/xml/LaTeXStd.xsl"/>
  <xsl:output method="text" indent="no" encoding="EUC-JP"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:Spec">
        <!-- Only for Top Page -->
        <xsl:if test="Header/@TopPage">
<xsl:text>\documentclass[a4j]{</xsl:text><xsl:value-of select="Header/BaseLatexStyle/@name"/><xsl:text>}
\usepackage{system}
</xsl:text>
<xsl:text>
\title{%
</xsl:text>
<xsl:value-of select="Header/SystemName"/>
<xsl:text>\\%
</xsl:text>
<xsl:value-of select="Header/Title"/>
<xsl:text>}</xsl:text>
<xsl:text>
\author{%
</xsl:text>
<xsl:value-of select="Header/Owner"/>
<xsl:text>}</xsl:text>
<xsl:text>
\date{%
</xsl:text>
<xsl:value-of select="Header/Date"/>
<xsl:text>}</xsl:text>
<xsl:text>
\begin{document}
\begin{titlepage}
\maketitle
\end{titlepage}
\pagenumbering{roman}
\tableofcontents
\newpage
\pagenumbering{arabic}
</xsl:text>
        </xsl:if>
        
        <xsl:for-each select="Body/Chapter">
          <xsl:choose>
            <xsl:when test="Title/Input">
              <xsl:apply-templates select="Title/Input"/>
            </xsl:when>
            <xsl:otherwise>
<xsl:text>\chapter{%
</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>}</xsl:text>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:apply-templates select="Text"/>

          <xsl:for-each select="Section">
<xsl:text>\section{%
</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>}</xsl:text>

            <xsl:apply-templates select="Text"/>

            <xsl:for-each select="SubSection">
<xsl:text>\subsection{%
</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>}</xsl:text>

              <xsl:apply-templates select="Text"/>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>

        <xsl:for-each select="Body/Section">
          <xsl:choose>
            <xsl:when test="Title/Input">
              <xsl:apply-templates select="Title/Input"/>
            </xsl:when>
            <xsl:otherwise>
<xsl:text>\section{%
</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>}</xsl:text>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:apply-templates select="Text"/>

          <xsl:for-each select="SubSection">
<xsl:text>\subsection{%
</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>}</xsl:text>

            <xsl:apply-templates select="Text"/>
          </xsl:for-each>
        </xsl:for-each>

      <xsl:if test="Header/@TopPage">
<xsl:text>\end{document}</xsl:text>
      </xsl:if>
  </xsl:template>

  <xsl:template match="Input">
<xsl:text>
\input </xsl:text><xsl:value-of select="@file"/><xsl:text>.tex

</xsl:text>

  </xsl:template>

</xsl:stylesheet>
