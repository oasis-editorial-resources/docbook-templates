<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<!-- This stylesheet is a layer on top of the OASIS A4 stylesheets used to 
     engage a US letter page size.-->

<xsl:import href="oasis-2025-spec-note-fo-a4.xsl"/>

<!-- ============================================================ -->
<!-- Parameters -->

<xsl:param name="paper.type" select="'USletter'"/>

</xsl:stylesheet>
