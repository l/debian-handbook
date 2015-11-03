<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:param name="latex.engine.options">
    <xsl:text>-output-driver='xdvipdfmx'</xsl:text>
    <!--
This is for overriding xelatex's default
-output-driver option 'xdvipdfmx -q -E'.
xdvipdfmx should respect to the Font Embedding Permissions,
'-E' option neglects this behavior and
'-q' will suppress showing the warning.
-->
  </xsl:param>
  <xsl:param name="xetex.font">
    <xsl:text>
\XeTeXtracingfonts=1
\defaultfontfeatures+{Scale=0.8}
\setmainfont{DejaVu Serif}
\setsansfont{DejaVu Sans}
\setmonofont{DejaVu Sans Mono}
\usepackage[AutoFallBack=true]{zxjatype}
\usepackage[ipa,scale=0.8]{zxjafont}
%
% Please don't use IPAex family fonts like IPAexMincho and/or IPAexGothic.
% Because some characters are converted into Kangxi radical.
% Example:
% 一 (U+4E00) -&gt; ⼀ (U+2F00),
% 人 (U+4EBA) -&gt; ⼈ (U+2F08),
% 非 (U+975E) -&gt; ⾮ (U+2FAE),
% 高 (U+9AD8) -&gt; ⾼ (U+2FBC) etc...
% This conversion is not problem for printing, but
% is problem for searching pdf and converting pdf into text.
</xsl:text>
  </xsl:param>
</xsl:stylesheet>
