<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
	<html>
		<head>
			<title>shoshi</title>
		</head>
		<body>
			<ul>
				<xsl:apply-templates select="books/item" />
			</ul>
		</body>
	</html>
</xsl:template>

<xsl:template match="item">
	<li>
		<a>
			<xsl:attribute name="href">
				shosai.cgi?no=<xsl:value-of select="@no" />
			</xsl:attribute>
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>