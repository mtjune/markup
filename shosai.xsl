<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes" />

<xsl:param name="query" select="'0'" />

<xsl:variable name="key1">
	<xsl:value-of select="books/item[@no=$query]/keywords/keyword[1]" />
</xsl:variable>
<xsl:variable name="key2">
	<xsl:value-of select="books/item[@no=$query]/keywords/keyword[2]" />
</xsl:variable>
<xsl:variable name="key3">
	<xsl:value-of select="books/item[@no=$query]/keywords/keyword[3]" />
</xsl:variable>

<xsl:template match="/">
	<html>
	<head>
		<title><xsl:value-of select="books/item[@no=$query]/title" /></title>
	</head>
	<body>
		<xsl:apply-templates select="books/item[@no=$query]" />

	<h3>↓似たカテゴリの書籍↓</h3>
	<xsl:apply-templates select="books/item[(keywords/keyword = $key1) or (keywords/keyword = $key2) or (keywords/keyword = $key3)][@no != $query]" />

	</body>
	</html>
</xsl:template>

<xsl:template match="item">
	<div>
		<h1><xsl:value-of select="title" /></h1>
		
		<table border="1" width="80%">
			<tr>
				<th>著者</th>
				<td><xsl:value-of select="creator" /></td>
			</tr>
			<tr>
				<th>出版社</th>
				<td><xsl:value-of select="publisher" /></td>
			</tr>
			<tr>
				<th>出版日</th>
				<td>
					<xsl:value-of select="date/year" />/
					<xsl:value-of select="date/month" />/
					<xsl:value-of select="date/day" />
				</td>
			</tr>
			<tr>
				<th>価格</th>
				<td><xsl:value-of select="price" /></td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td><xsl:value-of select="isbn" /></td>
			</tr>
			<tr>
				<th>説明</th>
				<td><xsl:value-of select="description" /></td>
			</tr>
			<tr>
				<th>キーワード</th>
				<td>
					<xsl:apply-templates select="keywords/keyword" />
				</td>
			</tr>
			<tr>
				<th>参考URL</th>
				<td>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="url/@resource" />
						</xsl:attribute>
						<xsl:value-of select="url/@resource" />
					</a>
				</td>
			</tr>
		</table>
	</div>
	<hr />
</xsl:template>

<xsl:template match="keyword">
	<xsl:value-of select="./text()" />
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>