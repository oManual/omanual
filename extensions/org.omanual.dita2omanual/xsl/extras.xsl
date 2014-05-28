<?xml version='1.0'?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="xsi"
>

<xsl:variable name="message-table">
  <!-- These are informational and often include diagnostic queries as params. -->
  <name code="010">HTML-formatted info about the category.</name>
  <name code="011">Unmatched element needing consideration.</name><!-- origin passes name of unmatched element -->
  <name code="000">Skipping topic</name><!--origin passes name of skipped element -->
  <name code="001">Skipping concept</name><!--origin passes name of skipped element -->
  <name code="002">Skipping reference</name><!--origin passes name of skipped element -->
  <name code="003">Skipping a grouping topicref</name><!--origin passes name of skipped element -->
  <name code="004">Outputting</name><!-- origin passes output filename info -->

  <!-- These are validation conditions that need to be met, either in source prep or post migration cleanup. -->
  <name code="005">Banner image. A local image; use empty string if not specified.</name>
  <name code="006">Author. Please identify an author (and corresponding @id).</name>
  <name code="007">Time required. Please fill in a suggested time value.</name>
  <name code="008">Difficulty. Please fill in  suggested level of difficulty, skill, or experience.</name>
  <name code="009">Category. </name> <!-- Note: map to prolog/metadata/category for now (note that DITA allows multiples)-->
</xsl:variable>

<!--xsl:variable name="stylesheet" select="document('')"/-->
<xsl:key name="message-code" match="name" use="@code"/>



<!-- Utilities -->

<!-- message utility -->
<xsl:template name="output-message">
    <xsl:param name="msgnum"/>
    <xsl:param name="msgsev"/>
    <xsl:param name="msg"/>
    <xsl:param name="msgparms"/>
    <!-- msgprefix should be global -->
 	<xsl:if test="$SHOW-MESSAGES='yes'">
		<xsl:message><xsl:value-of select="$msgprefix"/><xsl:value-of select="$msgnum"/><xsl:value-of select="$msgsev"/>:<xsl:value-of select="key('message-code',$msgnum,$message-table)"/> [<xsl:value-of select="$msgparms"/>]</xsl:message>
		<!--xsl:value-of select="$msg"/-->
    </xsl:if>
</xsl:template>


<!-- Missed element catch-all:
	pass any other nodes through unchanged
	use class value to retrieve unchanged -->
<xsl:template match="*">
	<!-- Message  to remind developer to handle the case -->
	<xsl:call-template name="output-message">
		<xsl:with-param name="msgnum">011</xsl:with-param>
		<xsl:with-param name="msgsev">I</xsl:with-param>
		<xsl:with-param name="msgparms"><xsl:value-of select="name(.)"/></xsl:with-param>
		<xsl:with-param name="msg">Unmatched element needing consideration.</xsl:with-param>
	</xsl:call-template>
	<span class="unmatched {name(.)}" style="background-color: yellow">
		<xsl:copy-of select="."/>
	</span>
</xsl:template>

<!-- common utility for all topicref links -->

<xsl:template name="newlink">
	<xsl:variable name="fixedhref">
		<xsl:choose>
			<xsl:when test="contains(@href,'http://')">
				<!-- The href value is already presumeably a standard URL that was authored compliantly. -->
				<xsl:value-of select="@href"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- The standard file-based href source conventions need to be normalized per the API syntax. -->
				<!-- strip the extension off the href attribute -->
				<xsl:variable name="resource-fn">
					<xsl:value-of select="substring-before(@href,'.')"/>
				</xsl:variable>
				<!-- normalize any nested path by converting path separator / into a period . -->
				<xsl:variable name="dotted-href">
					<xsl:value-of select=" replace($resource-fn,'/','.')"/>
				</xsl:variable>
				<!-- The groupName and mapName values were passed in by the calling context (known context) -->
				<xsl:value-of select="$dotted-href"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<a class="a nav" href='{$fixedhref}?edit'>
		<xsl:if test='@scope'><xsl:attribute name='target'><xsl:value-of select='@scope'/></xsl:attribute></xsl:if>
		<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
		<span class="navtitle">
			<xsl:choose>
			<!--
					<xsl:when test="$resource-ext = 'xml'">
						<xsl:value-of select="serviceType"/>/xml/<xsl:value-of select="$dotted-href"/>
					</xsl:when>
					<xsl:when test="$resource-ext = 'dita'">
						<xsl:value-of select="$serviceType"/>/topic/<xsl:value-of select="$dotted-href"/>
					</xsl:when>
					<xsl:when test="$resource-ext = 'ditamap'">
						<xsl:value-of select="$serviceType"/>/ditamap/<xsl:value-of select="$dotted-href"/>
					</xsl:when>
					<xsl:when test="$resource-ext = 'ditaval'">
						<xsl:value-of select="$serviceType"/>/ditaval/<xsl:value-of select="$dotted-href"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$serviceType"/>/<xsl:value-of select="$resourceType"/>/<xsl:value-of select="$dotted-href"/>
					</xsl:otherwise>
			-->
				<xsl:when test="@navtitle">
					<xsl:value-of select="@navtitle"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- force a value so that the element is not left empty. -->
					<span style="color:darkgreen;text-decoration:italic;"><xsl:value-of select="@href"/></span>
				</xsl:otherwise>
			</xsl:choose>
		</span>
	</a>
</xsl:template>


</xsl:stylesheet>
