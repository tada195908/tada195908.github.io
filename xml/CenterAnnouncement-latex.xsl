<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="EUC-JP"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/CenterAnnouncement">
  \documentclass[a4j]{jarticle}
  \pagestyle{empty}
  \begin{document}
  \begin{flushright}
    <xsl:value-of select="Year" />年<xsl:value-of select="Month" />月
<!--<xsl:value-of select="Date" />日-->
  \end{flushright}
  \begin{flushleft}
    <xsl:value-of select="JapaneseDocument/To" />
  \end{flushleft}
  \begin{flushright}
    <xsl:apply-templates select="JapaneseDocument/From" />
  \end{flushright}
  \begin{center}\Large
    <xsl:apply-templates select="JapaneseDocument/Title" />
  \end{center}
      <xsl:choose>
        <xsl:when test="JapaneseDocument/MainText/Section">
          <xsl:for-each select="JapaneseDocument/MainText/Section">
            <xsl:text>
\section{</xsl:text>
              <xsl:if test="Title">
                <xsl:apply-templates select="Title"/>
              </xsl:if>
            <xsl:text>}
</xsl:text>
              
            <xsl:apply-templates select="Text"/>
            <xsl:for-each select="Subsection">
              <xsl:text>
\subsection{</xsl:text>
                <xsl:if test="Title">
                  <xsl:apply-templates select="Title"/>
                </xsl:if>
                <xsl:text>}
</xsl:text>

              <xsl:apply-templates select="Text"/>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="JapaneseDocument/MainText"/>
        </xsl:otherwise>
      </xsl:choose>
  \end{document}
  </xsl:template>
  <xsl:template match="p">
    <xsl:text></xsl:text>
    <xsl:apply-templates />
    <xsl:text>

    </xsl:text>
  </xsl:template>
    <xsl:template match="br">
      <xsl:text>\\
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

  <xsl:template match="pre">
    <xsl:text>
\begin{verbatim}
</xsl:text>
    <xsl:copy-of select="."/>
    <xsl:text>
\end{verbatim}
</xsl:text>
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

</xsl:stylesheet>
