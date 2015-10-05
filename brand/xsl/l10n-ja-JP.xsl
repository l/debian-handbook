<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="ja">
      <l:context name="title">
        <l:template name="appendix" text="付録 %n「%t」"/>
        <l:template name="chapter" text="第 %n 章「%t」"/>
        <l:template name="example" text="例 %n %t"/>
        <l:template name="figure" text="図 %n %t"/>
        <l:template name="table" text="表 %n %t"/>
      </l:context>
      <!--
      <l:context name="title-unnumbered">
        <l:template name="appendix" text="「%t」"/>
        <l:template name="chapter" text="「%t」"/>
        <l:template name="section" text="「%t」"/>
      </l:context>
      -->
      <l:context name="title-numbered">
        <l:template name="appendix" text="付録 %n %t"/>
        <l:template name="chapter" text="第 %n 章 %t"/>
        <l:template name="section" text="%n. %t"/>
      </l:context>
      <!--
      <l:context name="subtitle">
        <l:template name="appendix" text="%s"/>
        <l:template name="chapter" text="%s"/>
        <l:template name="section" text="%s"/>
      </l:context>
      -->
      <l:context name="xref">
        <!--
        <l:template name="appendix" text="%t"/>
        <l:template name="chapter" text="%t"/>
        <l:template name="section" text="「%t」"/>
        -->
        <l:template name="page.citation" text="%p ページ"/>
        <l:template name="sidebar" text="「%t」"/>
      </l:context>
      <l:context name="xref-number">
        <l:template name="appendix" text="付録 %n"/>
        <l:template name="chapter" text="第 %n 章"/>
        <l:template name="example" text="例 %n"/>
        <l:template name="figure" text="図 %n"/>
        <l:template name="section" text="第 %n 節"/>
        <l:template name="table" text="表 %n"/>
      </l:context>
      <l:context name="xref-number-and-title">
        <l:template name="appendix" text="付録 %n「%t」"/>
        <l:template name="chapter" text="第 %n 章「%t」"/>
        <l:template name="example" text="例 %n %t"/>
        <l:template name="figure" text="図 %n %t"/>
        <l:template name="section" text="第 %n 節「%t」"/>
        <l:template name="table" text="表 %n %t"/>
      </l:context>
    </l:l10n>
  </l:i18n>
</xsl:stylesheet>
