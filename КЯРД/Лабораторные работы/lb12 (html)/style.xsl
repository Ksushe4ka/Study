<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Format.">
     <xsl:template match="book">
  <xsl:copy>
    <xsl:for-each select="par">
      <xsl:sort select="parag" order="descending" />
      <xsl:sort select="page" />
      <xsl:copy-of select="." />
    </xsl:for-each>
  </xsl:copy>
</xsl:template>
</xsl:stylesheet>