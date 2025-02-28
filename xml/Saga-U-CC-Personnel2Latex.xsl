<?xml version="1.0" encoding="ISO-2022-JP"?>
<!-- センター人事用XSL -->
<!-- 2004/5/26 作成 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"  version="1.0">

  <xsl:output method="text" encoding="EUC-JP" />
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Saga-U-CC:Personnel">
    <xsl:text>
\documentclass[a4j]{jarticle}
\pagestyle{empty}
\begin{document}
\begin{flushright}
    </xsl:text>
    <xsl:value-of select="Date" />
    <xsl:text>
\end{flushright}
\begin{flushleft}
    </xsl:text>
    <xsl:value-of select="ToAddress" />
    <xsl:text>
\end{flushleft}
\begin{flushright}
    </xsl:text>
    <xsl:value-of select="FromAddress" />
    <xsl:text>
\end{flushright}
\begin{center}\Large%
    </xsl:text>
    <xsl:value-of select="Title" />
    <xsl:text>
\end{center}

    </xsl:text>
    
    <xsl:apply-templates select="MainText/Opening"/>

    <xsl:text>\begin{center}記\end{center}</xsl:text>

    <xsl:text>
\newcounter{term}
\def\Term{\refstepcounter{term}\theterm.}
\begin{center}
\begin{tabular}{llp{110mm}}
%
    </xsl:text>
    <xsl:for-each select="MainText/Terms/Term">
      <xsl:text>\Term&amp;</xsl:text>
      <xsl:apply-templates select="Name"/>
      <xsl:text>&amp;</xsl:text>
      <xsl:apply-templates select="Text"/>
      <xsl:text>
\\
      </xsl:text>
    </xsl:for-each>
    <xsl:text>
\end{tabular}
\end{center}
\end{document}
    </xsl:text>
  </xsl:template>

  <!-- 本文内の書式設定 -->
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

  <xsl:template match="quote">
    <xsl:text>\begin{quote}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{quote}</xsl:text>
  </xsl:template>


  <xsl:template match="a">
    <xsl:text>\begin{verbatim}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{verbatim}</xsl:text>
  </xsl:template>


</xsl:stylesheet>
