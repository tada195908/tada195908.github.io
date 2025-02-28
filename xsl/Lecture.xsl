<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://aoba.cc.saga-u.ac.jp/ns Lecture.xsd"
                xmlns:own="http://aoba.cc.saga-u.ac.jp/ns"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="own:Lecture">
        <html>
            <head>
                <title>
                    <xsl:value-of select="own:Title"/>
                </title>
                <xsl:choose>
                    <xsl:when test="own:link/@href!='/base.css'">
                        <xsl:element name="link">
                            <xsl:attribute name="rel">
                                <xsl:value-of select="own:link/@rel" />
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:value-of select="own:link/@href" />
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <link rel="stylesheet" href="/base.css"/>
                    </xsl:otherwise>
                </xsl:choose>
                <meta charset="utf-8"/>
                <script src="/util.js" type="text/javascript"></script>
            </head>

            <body>
                <header>
                    <h1>
                        <xsl:apply-templates select="own:Title"/>
                    </h1>
                    <div align="center">
                        <xsl:apply-templates select="own:Subtitle"/>
                    </div>
                    <div align="right">
                        <xsl:apply-templates select="own:Author"/>
                    </div>
                    <xsl:if test="own:Date">
                        <div align="right">
                            <xsl:apply-templates select="own:Date"/>
                        </div>
                    </xsl:if>
                    <hr />
                </header>
                <xsl:for-each select="own:Section">
                    <h2>
                        <xsl:number count="own:Section" level="multiple" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="own:Title" />
                    </h2>
                    <xsl:apply-templates select="own:div" />
                    <xsl:for-each select="own:Subsection">
                        <h3>
                            <xsl:number count="own:Section" level="multiple" />
                            <xsl:text>.</xsl:text>
                            <xsl:number count="own:Subsection" level="multiple"/>
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="own:Title" />
                        </h3>
                        <xsl:apply-templates select="own:div" />
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:apply-templates select="own:div" />


                <hr/>
                <a href="/index.html">トップへ戻る</a>
                <hr/>
                <div>
                    <xsl:value-of select="own:Author"/>
                    <br/>
                    <xsl:value-of select="own:Author/@Institute"/>
                    <br/>
                    <xsl:if test="own:Author/@Email">
                        <xsl:text>E-mail:</xsl:text>
                        <xsl:value-of select="own:Author/@Email"/>
                    </xsl:if>
                    <xsl:if test="own:Author/@EmailImg">
                        <xsl:text>E-mail:</xsl:text>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="own:Author/@EmailImg" />
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:if>
                </div>
                <xsl:text>&#xA;</xsl:text>
                <script type="text/javascript">
                    
                    <xsl:text>&#xA;//&lt;![CDATA[&#xA;</xsl:text>
                    <xsl:apply-templates select="own:expandableMenuList" />
                    
                    <xsl:text>&#xA;//]]&gt;&#xA;</xsl:text>
                </script>
                <xsl:text>&#xA;</xsl:text>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="own:expandableMenuList">
        <xsl:for-each select="own:expandableMenu">
            <xsl:text>window.onload=setMenuDisplayNone('</xsl:text>
            <xsl:apply-templates />
            <xsl:text>');</xsl:text>

        </xsl:for-each>
    </xsl:template>
    <xsl:template match="own:tt">
        <tt>
            <xsl:apply-templates />
        </tt>
    </xsl:template>

    <xsl:template match="own:i">
        <i>
            <xsl:apply-templates />
        </i>
    </xsl:template>

    <xsl:template match="own:b">
        <b>
            <xsl:apply-templates />
        </b>
    </xsl:template>

    <xsl:template match="own:ul">
        <xsl:element name="ul">
            <xsl:if test="@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="own:ol">
        <ol>
            <xsl:apply-templates />
        </ol>
    </xsl:template>

    <xsl:template match="own:li">
        <xsl:element name="li">
            <xsl:if test="@expand">
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="onclick">
                    <xsl:text>expandMenu('</xsl:text>
                    <xsl:value-of select="@expand"/>
                    <xsl:text>')</xsl:text>
                </xsl:attribute>
                <xsl:text>(+)</xsl:text>
            </xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="own:p">
        <p>
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="own:br">
        <br />
    </xsl:template>

    <xsl:template match="own:a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@href" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="own:applet">
        <xsl:element name="applet">
            <xsl:attribute name="archive">
                <xsl:value-of select="@archive"/>
            </xsl:attribute>
            <xsl:attribute name="code">
                <xsl:value-of select="@code"/>
            </xsl:attribute>
            <xsl:attribute name="width">
                <xsl:value-of select="@width"/>
            </xsl:attribute>
            <xsl:attribute name="height">
                <xsl:value-of select="@height"/>
            </xsl:attribute>
            <xsl:for-each select="param">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

  <!-- HTMLとLaTeXで違うエスケープ -->
    <xsl:template match="own:escape">
        <xsl:apply-templates />
    </xsl:template>

  <!-- 表 -->
    <xsl:template match="own:Table">
        <xsl:if test="string-length(@Label)>0">
            <xsl:element name="a">
                <xsl:attribute name="name">
                    <xsl:value-of select="@Label" />
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
        <table border="1" align="center">
            <tr>
                <xsl:copy-of select="TableHeader/*" />
            </tr>
            <xsl:apply-templates select="TableBody/*" />
        </table>
    </xsl:template>

    <xsl:template match="own:td">
        <td>
            <xsl:apply-templates />
        </td>
    </xsl:template>

    <xsl:template match="own:tr">
        <tr>
            <xsl:apply-templates />
        </tr>
    </xsl:template>


    <xsl:template match="own:img">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@src"/>
            </xsl:attribute>
            <xsl:attribute name="width">
                <xsl:value-of select="@width"/>
            </xsl:attribute>
            <xsl:attribute name="height">
                <xsl:value-of select="@height"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="@alt"/>
            </xsl:attribute>
            <xsl:attribute name="align">
                <xsl:value-of select="@align"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

