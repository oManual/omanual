<?xml version="1.0" encoding="utf-8"?><xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xsi" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

	<!-- additional templates (refactored code) -->
	<xsl:import href="extras.xsl"></xsl:import>
	<xsl:import href="map2category.xsl"></xsl:import>
	<xsl:import href="topic2guide.xsl"></xsl:import>

	
	
	<!--xsl:strip-space elements="body map"/-->
	<xsl:preserve-space elements="pre screen lines"></xsl:preserve-space> 

	<!-- parameters that can be defined externally -->
	<xsl:param name="GENERATE-OUTLINE-NUMBERING" select="&apos;no&apos;"></xsl:param>
	<xsl:param name="SHOW-MESSAGES" select="&apos;yes&apos;"></xsl:param>
	<!-- guideid and categoryname are used in RESTful addressing; define here? -->
	<xsl:param name="REST_path" select="&apos;https://www.ifixit.com/api/2.0/&apos;"></xsl:param>
	<xsl:param name="file_path" select="&apos;./&apos;"></xsl:param>
	<xsl:param name="outputpath" select="&apos;_temp&apos;"></xsl:param> <!-- to cover legacy usage for now -->
	<!-- outputpath is currently relative to the calling processor (usually wherever the java is executed from) -->
	<xsl:param name="msgprefix" select="&apos;D2OM&apos;"></xsl:param>
	<xsl:param name="locale" select="&apos;en&apos;"></xsl:param> <!-- DITA uses a language code. 'en' as default; DITA language values will set the final value. -->
	

	<!-- set the result tree (output) encoding -->
	<xsl:output method="xml" encoding="utf-8" indent="yes"></xsl:output>

	<!-- Pick up some environment values that we might access globally. -->
	<xsl:variable name="outermostElementName" select="name(/*)"></xsl:variable>
	<!-- a "line break" code for forcing result tree line breaks -->
	<xsl:variable name="lbr"><xsl:text>
</xsl:text></xsl:variable>

	<!-- Root template: first stop for all processes (common starting conditions). -->
	<xsl:template match="/">
		<xsl:comment>Document element: <xsl:value-of select="$outermostElementName"></xsl:value-of></xsl:comment>
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>

	<!-- Entry point for any topic or non-specific, topic-based specialization (maps to oManual guide). -->
	<xsl:template name="topic" match="*[contains(@class,&quot; topic/topic &quot;)]">
		<xsl:comment>Transform entry point for: DITA topic to oManual topic (general)</xsl:comment>
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<!-- Entry point for concept (maps to oManual guide (rendered into oManual's content element)). -->
	
	<!-- Entry point for reference (maps to oManual guide (rendered into oManual's content element)). -->
	
	<!-- Entry point for task (maps to oManual guide (generally a direct relationship)). -->
	<!--
	<xsl:template name='task' match='*[contains(@class," topic/task ")]'>
		<xsl:comment>Transform entry point for: DITA task to oManual guide (procedural)</xsl:comment>
		<xsl:comment> call the topic processor essentially as a subroutine </xsl:comment>	
		<xsl:call-template name="chunkTopic">
			<xsl:with-param name="thisdoc" select="$tempdoc"/>
			<xsl:with-param name="thislang" select="$thislang"/>
			<xsl:with-param name="thistitle" select="$thistitle"/>
			<xsl:with-param name="thisid" select="$thisid"/>
		</xsl:call-template>
	</xsl:template>
	-->

</xsl:stylesheet>