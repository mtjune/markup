<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes" />

<xsl:param name="s_title" select="''" />
<xsl:param name="s_auther" select="''" />
<xsl:param name="sortkey" select="'title'" />


<xsl:template match="/">
	<html>
		<head>
			<title>shoshi</title>
		</head>
		<body>
			<h3>並べ替え：
			<xsl:choose>
				<xsl:when test="contains($sortkey, 'title')">
					<xsl:text>タイトル</xsl:text>
				</xsl:when>
				<xsl:when test="contains($sortkey, 'creator')">
					<xsl:text>著者</xsl:text>
				</xsl:when>
				<xsl:when test="contains($sortkey, 'date')">
					<xsl:text>出版日</xsl:text>
				</xsl:when>
				<xsl:when test="contains($sortkey, 'price')">
					<xsl:text>価格</xsl:text>
				</xsl:when>
			</xsl:choose>
		</h3>
			<ul>
				<xsl:choose>
					<xsl:when test="contains($sortkey, 'creator')"><xsl:call-template name="sort_creator" /></xsl:when>
					<xsl:when test="contains($sortkey, 'date')"><xsl:call-template name="sort_date" /></xsl:when>
					<xsl:when test="contains($sortkey, 'price')"><xsl:call-template name="sort_price" /></xsl:when>
					<xsl:otherwise><xsl:call-template name="sort_title" /></xsl:otherwise>
				</xsl:choose>
			</ul>
		</body>
	</html>
</xsl:template>

<xsl:template name="sort_title">
	<xsl:apply-templates select="books/item[contains(title/text(), $s_title)][contains(creator/text(), $s_auther)]">
		<xsl:sort select="title" data-type="text" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template name="sort_creator">
	<xsl:apply-templates select="books/item[contains(title/text(), $s_title)][contains(creator/text(), $s_auther)]">
		<xsl:sort select="creator" data-type="text" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template name="sort_date">
	<xsl:apply-templates select="books/item[contains(title/text(), $s_title)][contains(creator/text(), $s_auther)]">
		<xsl:sort select="date/year" data-type="number" />
		<xsl:sort select="date/month" data-type="number" />
		<xsl:sort select="date/day" data-type="number" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template name="sort_price">
	<xsl:apply-templates select="books/item[contains(title/text(), $s_title)][contains(creator/text(), $s_auther)]">
		<xsl:sort select="price" data-type="number" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="item">
	<li>
		<a>
			<xsl:attribute name="href">
				shosai.cgi?no=<xsl:value-of select="@no" />
			</xsl:attribute>
			<xsl:value-of select="title" /><xsl:text> -- </xsl:text><xsl:value-of select="creator" />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>