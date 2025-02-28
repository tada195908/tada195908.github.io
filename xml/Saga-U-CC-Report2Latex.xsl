<?xml version="1.0" encoding="EUC-JP"?>
<!-- 報告用XSL -->
<!-- Saga-U-CC.Report.dtd対応 -->
<!-- 2003/4/20  作成 -->
<!-- 2004/4/20  最終変更 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp">
  <xsl:output method="text" indent="yes" encoding="EUC-JP"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:Report">
  <xsl:text>
  \documentclass[a4j]{jarticle}
  \usepackage{graphics}
  \begin{document}
  </xsl:text>
  <xsl:text>
  \begin{flushleft}
  </xsl:text>
    <div align="left"><xsl:value-of select="ToAddress" /></div>
  <xsl:text>
  \end{flushleft}
  </xsl:text>
  <xsl:text>
  \begin{flushright}
  </xsl:text>
    <xsl:value-of select="Date" /><xsl:text>\\</xsl:text>
    <xsl:value-of select="Author" /><xsl:text>\\</xsl:text>
    <xsl:value-of select="Address" /><xsl:text></xsl:text>
  <xsl:text>
  \end{flushright}
  \begin{center}\Large
  </xsl:text>
    <xsl:value-of select="Title" />
  <xsl:text>
  \end{center}
  </xsl:text>

  <xsl:apply-templates select="Text"/>
  <xsl:for-each select="Section">
    <xsl:text>\section{</xsl:text>
      <xsl:apply-templates select="Title" />
    <xsl:text>}</xsl:text>
    <xsl:apply-templates select="Text"/>

      <xsl:for-each select="Subsection">
        <xsl:text>\subsection{</xsl:text>
             <xsl:apply-templates select="Title" />
        <xsl:text>}</xsl:text>
          <xsl:apply-templates select="Text"/>
      </xsl:for-each>
    </xsl:for-each>
    <xsl:text>\end{document}</xsl:text>
  </xsl:template>


  <!-- 本文内の書式設定 -->
  <xsl:template match="p">
    <xsl:text></xsl:text>
    <xsl:apply-templates />
    <xsl:text>

    </xsl:text>
  </xsl:template>


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
  <xsl:template match="ul">
    <xsl:text>
      \begin{itemize}
    </xsl:text>
    <xsl:apply-templates />
    <xsl:text>
      \end{itemize}
    </xsl:text>
  </xsl:template>
  <xsl:template match="ol">
    <xsl:text>
      \begin{enumerate}
    </xsl:text>
    <xsl:apply-templates />
    <xsl:text>
      \end{enumerate}
    </xsl:text>
  </xsl:template>
  <xsl:template match="li">
    <xsl:text>
      \item{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}
    </xsl:text>
  </xsl:template>

  <xsl:template match="br">
    <xsl:text>\\</xsl:text>
  </xsl:template>

  <xsl:template match="a">
    <tt><xsl:value-of select="@href"/></tt>
  </xsl:template>

  <xsl:template match="Figure">
    <xsl:text>\begin{figure}\begin{center}
    </xsl:text>
    <xsl:if test="string-length(@Label)>0">
      <xsl:text>\label{</xsl:text><xsl:value-of select="@Label" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>\caption{</xsl:text>
    <xsl:value-of select="Caption"/>
    <xsl:text>}</xsl:text>

    <xsl:text>\resizebox{</xsl:text>
    <xsl:value-of select="img/@altwidth"/>
    <xsl:text>}{!}{\includegraphics{</xsl:text>
    <xsl:value-of select="img/@alt"/>
    <xsl:text>}}</xsl:text>
    <xsl:text>
\end{center}\end{figure}</xsl:text>
  </xsl:template>

  <xsl:template match="quote">
    <xsl:text>\begin{quote}
</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{quote}
</xsl:text>
  </xsl:template>

  <xsl:template match="quotation">
    <xsl:text>\begin{quotation}
</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{quotation}
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
