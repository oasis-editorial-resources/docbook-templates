<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                xmlns:lxslt="http://xml.apache.org/xslt"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="saxon xalanredirect lxslt exsl"
                version="1.0">

<xsl:import href="oasis-specification-html.xsl"/>

<xsl:param name="css.stylesheet">oasis-note.css</xsl:param>

<xsl:variable name="oasis-logo-width">270pt</xsl:variable>

<xsl:template match="articleinfo/title" mode="titlepage.mode">
  <div style="font-size:200%;font-weight:bold;color:#7f7f7f;margin-top:0pt"
    >OASIS Committee Note</div>
  <hr style="margin-bottom:0pt"/>
  <h1>
    <xsl:apply-templates/>
  </h1>
</xsl:template>

</xsl:stylesheet>
