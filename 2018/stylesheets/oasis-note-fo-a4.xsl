<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:saxon="http://icl.com/saxon"
                xmlns:lxslt="http://xml.apache.org/xslt"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                xmlns:exsl="http://exslt.org/common"
                xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
                exclude-result-prefixes="saxon lxslt xalanredirect exsl axf"
                extension-element-prefixes="saxon xalanredirect lxslt exsl"
                version="1.0">

<xsl:import href="oasis-specification-fo-a4.xsl"/>
<xsl:include href="support/titlepage-notes-fo.xsl"/>

<xsl:template match="articleinfo/title" 
              mode="article.titlepage.recto.auto.mode">
  <fo:block font-size="18pt" font-weight="bold" color="#7F7F7F"
            space-before="5pt"
    >OASIS Committee Note</fo:block>
  <fo:block font-size="3pt">
    <fo:leader leader-length="100%" leader-pattern="rule" color="black"/>
  </fo:block>
  <xsl:apply-imports/>
</xsl:template>

<xsl:template name="user.pagemasters">
  <fo:page-sequence-master master-name="oasis-note-body">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="body-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="body-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">body-even</xsl:when>
              <xsl:otherwise>body-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>
</xsl:template>
<xsl:template name="select.user.pagemaster">oasis-note-body</xsl:template>

<xsl:template name="header.content.new">
  <!--last minute change to remove all header content-->
</xsl:template>
  
<xsl:template name="header.content">
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
</xsl:template>
<xsl:param name="header.column.widths">0 100 0</xsl:param>

<xsl:template name="oasis-note-banner-text">
</xsl:template>

<xsl:template name="oasis-footer-separator">
  <fo:block font-size="3pt">
    <fo:leader leader-length="100%" leader-pattern="rule"/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
