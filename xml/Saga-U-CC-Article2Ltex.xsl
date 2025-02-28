<?xml version="1.0" encoding="EUC-JP"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:Saga-U-CC="http://www.cc.saga-u.ac.jp"
                version="1.0">
  <xsl:output method="text" indent="yes" encoding="EUC-JP"/>

  <xsl:template match="Saga-U-CC:Article">
    <xsl:text>
\documentclass[a4j]{jarticle}
    </xsl:text>
    <xsl:text>
\title{</xsl:text>
<xsl:apply-templates select="Title"/>
<xsl:text>\\--</xsl:text>
<xsl:apply-templates select="Subtitle"/>
<xsl:text>--}</xsl:text>
    <xsl:text>
\author{</xsl:text><xsl:value-of select="Author"/><xsl:text>}</xsl:text>
    <xsl:if test="Date">
      <xsl:text>
\date{</xsl:text><xsl:value-of select="Date"/><xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>
\begin{document}
\maketitle
    </xsl:text>

    <xsl:apply-templates select="Text" />

    <xsl:for-each select="Section">
      <xsl:text>
\section{%
      </xsl:text>
      <xsl:apply-templates select="Title" />
      <xsl:text>}</xsl:text>
      <xsl:apply-templates select="Text" />
      <xsl:if test="Subsection">
        <xsl:for-each select="Subsection">
          <xsl:text>
\subsection{%
          </xsl:text>
          <xsl:apply-templates select="@Title" />
          <xsl:text>}</xsl:text>
          <xsl:apply-templates select="Text" />
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
    <xsl:apply-templates select="Text" />
    <xsl:text>
\end{document}
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

  <xsl:template match="a">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
    <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <!-- HTMLとLaTeXで違うエスケープ -->
  <xsl:template match="escape">
    <xsl:apply-templates />
  </xsl:template>

  <!-- ログのような内容の一覧 -->
  <xsl:template match="Log">
    <table border="1" align="center">
      <tr><th>日付</th><th>内容</th></tr>
      <xsl:for-each select="Record">
        <tr>
          <td><xsl:value-of select="@Date"/></td>
          <td>
            <xsl:apply-templates />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  <xsl:template match="Table">
     <xsl:text>\begin{table}\begin{center}
     \caption{</xsl:text>
       <xsl:value-of select="@Title"/><xsl:text>}</xsl:text>
     <xsl:if test="string-length(@Label)>0">
        <xsl:text>\label{</xsl:text><xsl:value-of select="@Label" />
        <xsl:text>}
        </xsl:text>
     </xsl:if>
     <xsl:text>
\begin{tabular}{</xsl:text>
     <xsl:value-of select="@LatexFormat" />
     <xsl:text>}
     </xsl:text>

     <xsl:text>\hline
     </xsl:text>
     <xsl:apply-templates select="TableHeader" />
     <xsl:text>\\\hline
%
     </xsl:text>
     <xsl:apply-templates select="TableBody" />
     <xsl:text>\hline
     \end{tabular}
     </xsl:text>
     <xsl:text>\end{center}\end{table}</xsl:text>
  </xsl:template>

  <xsl:template match="TableHeader">
    <xsl:for-each select="th">
     <xsl:apply-templates />
     <xsl:if test="not(position()=last())">
       <xsl:text>&amp;</xsl:text>
     </xsl:if>
     </xsl:for-each>
  </xsl:template>

  <xsl:template match="TableBody">
    <xsl:for-each select="tr">
      <xsl:for-each select="td">
     <xsl:apply-templates />
     <xsl:if test="not(position()=last())">
       <xsl:text>&amp;</xsl:text>
     </xsl:if>
     </xsl:for-each>
     <xsl:text>\\
     </xsl:text>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>
