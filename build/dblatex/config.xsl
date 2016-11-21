<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:m="http://www.w3.org/1998/Math/MathML"
                version="1.0">

<!--
////// Update settings to customize the XSLT output to my taste //////
-->

<!-- Disable annoying warnings -->
<xsl:param name="output.quietly">1</xsl:param>
<xsl:param name="keep.relative.image.uris" select="1"/>

<!-- Ensure usage of UTF-8 & unicode -->
<xsl:param name="latex.encoding">utf8</xsl:param>
<xsl:param name="latex.unicode.use">1</xsl:param>

<!-- Control the links and internal references -->
<xsl:param name="ulink.show">1</xsl:param>
<xsl:param name="ulink.footnotes">1</xsl:param>
<xsl:param name="xref.with.number.and.title">1</xsl:param>
<xsl:param name="insert.xref.page.number">yes</xsl:param>
<xsl:param name="insert.link.page.number">yes</xsl:param>

<!-- Misc rendering options -->
<xsl:param name="make.year.ranges">1</xsl:param>
<xsl:param name="make.single.year.ranges">1</xsl:param>

<!-- Hyphenation related, try to avoid line overflows but still
     have good hyphenation -->
<xsl:param name="monoseq.hyphenation">0</xsl:param>
<xsl:param name="hyphenation.setup">sloppy</xsl:param>

<!-- Support scaling of listings -->
<xsl:param name="literal.extensions">scale.by.width</xsl:param>

<!-- Don't include any list of tables/figures/etc. -->
<xsl:param name="doc.lot.show"></xsl:param>
<!-- But include a table of contents -->
<xsl:param name="doc.toc.show">1</xsl:param>

<!-- The number of levels that are numbered -->
<xsl:param name="doc.section.depth">2</xsl:param>

<!-- The number of levels that are included in the TOC -->
<xsl:param name="toc.section.depth">3</xsl:param>
<xsl:param name="preface.tocdepth">0</xsl:param>

<!-- Paper size 'Crown Quarto' -->
<xsl:param name="full.bleed" select="0"/>
<xsl:param name="page.width">18.90cm</xsl:param>
<xsl:param name="page.height">24.58cm</xsl:param>
<xsl:param name="page.margin.inner">2cm</xsl:param> <!-- left -->
<xsl:param name="page.margin.outer">2cm</xsl:param> <!-- right -->
<xsl:param name="page.margin.top">1.3cm</xsl:param>
<xsl:param name="page.margin.bottom">1.3cm</xsl:param>

<!-- PDF color scheme
Acceptable values are
full-color (default, for PC/Tablet readers),
gray-scale (for lulu.com POD service),
-->
<xsl:param name="pdf.color.scheme">full-color</xsl:param>

<!-- Fonts used -->
<xsl:param name="xetex.font">
  <xsl:text>% dblatex template xetex.font starts here.&#10;</xsl:text>

  <xsl:choose>
    <xsl:when test="/book[@lang='ja-JP']">
      <xsl:text>
% Japanese setting
\defaultfontfeatures+{
Scale              = 0.8,
}

\setmainfont{M+ 2c regular}[
BoldFont       = {M+ 2c bold},
ItalicFont     = {M+ 2c bold},
BoldItalicFont = {M+ 2c bold},
SmallCapsFont  = {M+ 2c bold},
]
\setsansfont{M+ 1c regular}[
BoldFont       = {M+ 1c bold},
ItalicFont     = {M+ 1c bold},
BoldItalicFont = {M+ 1c bold},
SmallCapsFont  = {M+ 1c bold},
]
\setmonofont{M+ 1m regular}[
BoldFont       = {M+ 1m bold},
ItalicFont     = {M+ 1m bold},
BoldItalicFont = {M+ 1m bold},
SmallCapsFont  = {M+ 1m bold},
]

\newfontfamily{\JapSubstFont}{DejaVu Sans Mono}[
BoldFont       = {DejaVu Sans Mono Bold},
ItalicFont     = {DejaVu Sans Mono Bold},
BoldItalicFont = {DejaVu Sans Mono Bold},
SmallCapsFont  = {DejaVu Sans Mono Bold},
]

\XeTeXinterchartokenstate=1
\newXeTeXintercharclass\JapSubst

\XeTeXcharclass"FFFD=\JapSubst

\XeTeXinterchartoks 0 \JapSubst = {\begingroup\JapSubstFont}
\XeTeXinterchartoks 255 \JapSubst = {\begingroup\JapSubstFont}
\XeTeXinterchartoks \JapSubst 0 = {\endgroup}
\XeTeXinterchartoks \JapSubst 255 = {\endgroup}

\usepackage{xeCJK}

\setCJKmainfont[
BoldFont       = {M+ 2c bold},
ItalicFont     = {M+ 2c bold},
BoldItalicFont = {M+ 2c bold},
SmallCapsFont  = {M+ 2c bold},
]{M+ 2c regular}
\setCJKsansfont[
BoldFont       = {M+ 1c bold},
ItalicFont     = {M+ 1c bold},
BoldItalicFont = {M+ 1c bold},
SmallCapsFont  = {M+ 1c bold},
]{M+ 1c regular}
\setCJKmonofont[
BoldFont       = {M+ 1m bold},
ItalicFont     = {M+ 1m bold},
BoldItalicFont = {M+ 1m bold},
SmallCapsFont  = {M+ 1m bold},
]{M+ 1m regular}

% Please don't use
% * IPAex fonts like IPAexMincho and/or IPAexGothic,
% * font feature of AutoFakeBold and/or AutoFakeSlant.
% These rule is not a remedy for printing,
% but if these rule is broken, people will face problems of
% searching text, coping text, and converting pdf into text.
%
% If IPAexMincho and/or IPAexGothic fonts are used,
% some characters are converted into Kangxi radical (U+2F00..U+2FDF).
% Example:
% 一 (U+4E00) -&gt; ⼀ (U+2F00),
% 人 (U+4EBA) -&gt; ⼈ (U+2F08),
% 非 (U+975E) -&gt; ⾮ (U+2FAE),
% 高 (U+9AD8) -&gt; ⾼ (U+2FBC) etc...
% This conversion is not problem for printing, but
% is problem for searching pdf and converting pdf into text.
% And please take care of font licence also.
%
% If AutoFakeBold and/or AutoFakeSlant font features are used,
% some characters (\emph{}) will be unsearchable and uncopied.

\usepackage[AutoFallBack=true]{zxjatype}
</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>% /book/@lang="</xsl:text>
      <xsl:value-of select="/book/@lang"/>
      <xsl:text>"</xsl:text>
      <xsl:text>
% default setting
\setmainfont{Gentium Basic}
\setsansfont[Scale=MatchLowercase]{Linux Biolinum O}
\setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono}
</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>% dblatex template xetex.font ends here.&#10;</xsl:text>
</xsl:param>

<!-- In  Full-bleed mode, add crop margins of 0.25" (0.63cm) around
actual page. By default the page is centered as required in this mode.
-->
<xsl:param name="crop.marks">
  <xsl:if test="$full.bleed != 0">
    <xsl:text>1</xsl:text>
  </xsl:if>
  <xsl:if test="not($full.bleed != 0)">
    <xsl:text>0</xsl:text>
  </xsl:if>
</xsl:param>
<xsl:param name="crop.mode">off</xsl:param>

<xsl:param name="crop.page.width">
  <xsl:if test="$full.bleed != 0">
    <xsl:variable name="paper.width"
                  select="number(translate($page.width,'cm','
'))+0.635"/>
    <xsl:value-of select="concat(string($paper.width), 'cm')"/>
  </xsl:if>
</xsl:param>

<xsl:param name="crop.page.height">
  <xsl:if test="$full.bleed != 0">
    <xsl:variable name="paper.height"
                  select="number(translate($page.height,'cm','
'))+0.635"/>
    <xsl:value-of select="concat(string($paper.height), 'cm')"/>
  </xsl:if>
</xsl:param>

<!--
////// Extend the stylesheets to better suit my needs //////
-->
<xsl:param name="figure.emptypage">images/debian.png</xsl:param>
<xsl:param name="ulink.block.symbol">\ding{232}</xsl:param>

<xsl:template match="command|parameter|option|citerefentry">
  <xsl:call-template name="inline.monoseq"/>
</xsl:template>

<xsl:template match="literal|guimenu|guimenuitem|guisubmenu|keycap">
  <xsl:call-template name="inline.sansseq"/>
</xsl:template>

<xsl:template match="sidebar//literal">
  <xsl:call-template name="inline.monoseq"/>
</xsl:template>

<xsl:template match="replaceable">
  <xsl:call-template name="inline.italicseq"/>
</xsl:template>

<!-- Disable abstract page -->
<xsl:template match="abstract">
</xsl:template>

<!-- Extend/override generated texts:
     - override page citation text to "page %p"
     - auto-add quotes for xref to sidebar
     - don't start with capital letters
-->
<xsl:param name="local.l10n.xml" select="document('')"/>
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">

  <l:l10n language="en">
    <l:gentext key="minitoc" text="Contents"/>
    <l:gentext key="keywordset" text="Keywords"/>
    <l:context name="xref">
      <l:template name="page.citation" text=" page %p"/>
      <l:template name="sidebar" text="“%t”"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <!-- Don't start with capital letters -->
      <l:template name="chapter" text=" chapter %n, “%t”"/>
      <l:template name="section" text=" section %n, “%t”"/>
      <l:template name="appendix" text=" appendix %n, “%t”"/>
    </l:context>
  </l:l10n>

  <l:l10n language="es">
    <l:gentext key="minitoc" text="Contenidos"/>
    <l:gentext key="keywordset" text="Palabras clave"/>
    <l:context name="xref">
      <l:template name="page.citation" text=" p&#225;gina %p"/>
      <l:template name="sidebar" text="«%t»"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <l:template name="chapter" text=" Cap&#237;tulo %n: «%t»"/>
      <l:template name="section" text=" Secci&#243;n %n, «%t»"/>
    </l:context>
  </l:l10n>

  <l:l10n language="fr">
    <l:gentext key="minitoc" text="Sommaire"/>
    <l:gentext key="keywordset" text="Mots-cl&#233;s"/>
    <l:context name="xref">
      <l:template name="page.citation" text=" page %p"/>
      <l:template name="sidebar" text="« %t »"/>
    </l:context>
    <l:context name="xref-number">
      <!-- Don't start with capital letter -->
      <l:template name="table" text="tableau %n"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <!-- Don't start with capital letters -->
      <l:template name="chapter" text=" chapitre %n, « %t »"/>
      <l:template name="section" text=" section %n, « %t »"/>
      <l:template name="appendix" text=" annexe %n, « %t »"/>
    </l:context>
  </l:l10n>

  <l:l10n language="it">
    <l:gentext key="minitoc" text="Contenuto"/>
    <l:gentext key="keywordset" text="Parola chiave"/>
    <l:context name="xref">
      <l:template name="sidebar" text="«%t»"/>
    </l:context>
  </l:l10n>

  <l:l10n language="pt-BR">
    <l:gentext key="minitoc" text="Conteúdo"/>
    <l:gentext key="keywordset" text="Palavras chave"/>
    <l:context name="xref">
      <l:template name="page.citation" text=" página %p"/>
      <l:template name="sidebar" text="“%t”"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <!-- Don't start with capital letters -->
      <l:template name="chapter" text=" capítulo %n, “%t”"/>
      <l:template name="section" text=" seção %n, “%t”"/>
      <l:template name="appendix" text=" apêndice %n, “%t”"/>
    </l:context>
  </l:l10n>

  <xi:include xmlns:xi="http://www.w3.org/2001/XInclude" href="../../../../brand/xsl/l10n-ja-JP.xml"/>

</l:i18n>

</xsl:stylesheet>
