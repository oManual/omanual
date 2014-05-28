<?xml version='1.0'?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="xsi"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
>

	<xsl:param name="outputpath" select="''"/> <!-- to cover legacy usage for now -->
	<!-- outputpath is currently relative to the calling processor (usually wherever the java is executed from) -->
	<xsl:param name="msgprefix" select="'D2O'"/>


	<!-- Entry point for any map or map-based specialization. -->
	<!-- The map transforms leave behind content that was originally intended to be collected and
		saved as the "manifest" context. Next rev will convert this into a topic instead.
	-->
	<xsl:template name='map' match='*[contains(@class," map/map ")]'>

		<!-- prebuild the id attribute -->
		<xsl:variable name="thisid">
			<xsl:value-of select="@id"/>
		</xsl:variable>

		<!-- prebuild the locale attribute -->
		<xsl:variable name="thislang">
			<xsl:choose>
				<xsl:when test="@xml:lang !=''">
					<xsl:value-of select="@xml:lang"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$locale"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- preaccess the title value -->
		<xsl:variable name="map_title">
			<xsl:choose>
				<xsl:when test="@title !=''">
					<xsl:apply-templates select='@title'/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select='*[contains(@class," map/title ")]'/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

<!-- QUESTION: Should we come up with a pattern for generating filenames and pathnames for the result set? -->
<!-- eg, "{$segment_qualifier}/{$resource_qualifier}-{$product_qualifier}-{$version_number}" 
	which can be parsed for either immediate internal conversion or passed through for grep/replace.

   ANSWER: Internally, we generate omanual files with the following naming convention: 
         + {$category-name}/
            - {$category-name}.xml
            + {$guide-title-separated-by-dashes}-{$guideid}/
               - guide.xml
               + media/
                  - file1.pdf
                  - file2.psd
            + media/
               - file2.pdf

      ***As long as the category xml file name matches the omanual package name, ***
      we can import the omanual package into our system.
   -->
		
		<!-- ( topicref or topichead or topicgroup or... -->
		<!-- From Tim Asp: 
		The hierarchy defined by topicref's in the DITA map should be expressed through the 
		<ancestor> and <children> elements in the category schema, not through a folder hierarchy.
        Ordering doesn't matter for direct children of <category> elements. 
        -->
		<category locale="{$thislang}" id="{$thisid}"
				xmlns="http://omanual.com" 
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				>
            <!--xs:element ref="title" /-->
			<title><xsl:value-of select="$map_title"/></title>

            <!--xs:element ref="category_info" /-->
            <category_info />
            
            <!--xs:element ref="image" /-->
			<!-- query These values are not natively provided in DITA maps; need a convention for coding. -->
            <xsl:variable name="cat_image_file_pathname">http://www.example.com/</xsl:variable>
            <xsl:variable name="cat_image_media_pathname">media/main.jpg</xsl:variable>
			<!-- view -->
			<image>
				<xsl:value-of select="$cat_image_media_pathname"/>
			</image>

            <!--xs:element ref="description" /-->
			<description>{use shortdesc content here? use bookmap meta, be aware that HTML content will be stripped out. Make any dummy content to be paragraph like, therefore. 1 or 2 sentences, very brief, subtitle like.}</description>
			
			<!-- This is a pull for metadata, avoiding mismatch that push processing might introduce. -->
			<!--xsl:apply-templates select='*[contains(@class," map/topicmeta ")]'/-->

            <!--xs:element ref="flags" /-->
			<flags />

            <!--xs:element ref="ancestors" /-->
			<!-- query -->
            <xsl:variable name="ancestor">Root</xsl:variable>
			<!-- view -->
			<ancestors>
				<ancestor><xsl:value-of select="$ancestor"/></ancestor>
			</ancestors>

            <!--xs:element ref="children" /-->
            <!-- Step 1: all tasks as flat list (peer children)
            -->
			<children />

            <!--xs:element ref="solutions" /-->
            <xsl:variable name="solution_count">0</xsl:variable>
            <xsl:variable name="solution_url">http://example.com/</xsl:variable>
			<solutions count="{$solution_count}" url="{$solution_url}" />

            <!--xs:element ref="parts" /-->
			<parts />

            <!--xs:element ref="tools" /-->
			<tools />

            <!--xs:element ref="contents" /-->
            <contents>
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">010</xsl:with-param>
					<xsl:with-param name="msgsev">I</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">HTML-formatted info about the category.</xsl:with-param>
				</xsl:call-template>
	 			<p>HTML-formatted info about the category. {ie, "About" content: Identification, Model History, Additional Information}</p>
            </contents>

			<!--xs:element ref="guides" /-->
			<guides>
				<!-- this is the recursive drill-down into the map; will include topicheads and groups -->
				<!-- QUESTION: how to map a topichead or topicgroup into an oManual package view? -->
				<!-- A  topicref is the normal reference to a topic that will replace the reference on output;
					a topichead is a title-only container for titled hierarchies;
					a topicgroup is a title-less container for applying common processing/styling to a set of topics.
				-->

				<!-- for each guide in the set -->
				<xsl:if test='*[contains(@class," map/topicref ")]'>
					<xsl:apply-templates select='*[contains(@class," map/topicref ")]'/>
				</xsl:if>
				<!-- end for each -->
			</guides>

            <!--xs:element ref="documents" /-->
			<!-- QUESTION: DITA has no direct equivalent for this data; map reltable into this? -->
            <!--- Answer: This is for any other non-image/video documents that
                 belong to the guide.  If there isn't a direct equivalent, then it can just be left empty;
                 I don't think reltable elements belong in here.-->
			<documents>
				<!-- for each non-image/video document that belongs to the guide... -->
				<!-- query -->
				<xsl:variable name="document_date">2012-03-03T20:46:12-07:00</xsl:variable>
				<xsl:variable name="document_id">762</xsl:variable>
				<xsl:variable name="document_type">pdf</xsl:variable>
	            <xsl:variable name="document_image_media_pathname">media/iphone4gsmscrewtemp.pdf</xsl:variable>
				<!-- view -->
				<!-- for each document in the set -->
				<document date="{$document_date}" id="{$document_id}" type="{$document_type}"><xsl:value-of select="$document_image_media_pathname"/></document>
				<!-- end for each -->
			</documents>

		</category>			

		<!-- QUESTION: What is best practice for package level metadata:
				1. mapping existing DITA metadata into oManual (square peg in round hole analogy)
			 	2. creating a domain specialization to represent it more directly (recommended)
			 	3. other that we have not considered yet? Same issues will apply to DocBook, for example.
		-->
		
		<!-- ( navref or anchor or reltable or data or data-about) (any number) )-->
		<xsl:apply-templates select='navref|anchor|data|data-about|reltable'/>
	</xsl:template>


	<xsl:template match='navref|anchor|data|data-about|reltable'>
		<!-- TBD: Need to add processing support for these eventually! no output for these for now.-->
	</xsl:template> 

	<xsl:template match='*[contains(@class," map/topicref mapgroup-d/topicgroup ")]' priority='2'>
		<!-- for a DITA to oManual conversion, topicgroup and topichead are contentless nodes;
			perform no processing other than to specifically scan for child nodes of interest.
		-->
		<xsl:comment>Topicgroup: ancestor = <xsl:value-of select="local-name(parent::*)"/></xsl:comment>
		<xsl:if test='*[contains(@class," map/topicref ")]'>
		<xsl:comment>Topicgroup: children = <xsl:value-of select="local-name(child::*[1])"/> (use for-each to scan all)</xsl:comment>
				<xsl:apply-templates select='*[contains(@class," map/topicref ")]'/>
		</xsl:if>
	</xsl:template>

	<xsl:template match='*[contains(@class," map/topicref mapgroup-d/topichead ")]' priority='2'>
		<!-- for a DITA to oManual conversion, topicgroup and topichead are contentless nodes;
			perform no processing other than to specifically scan for child nodes of interest.
		-->
		<xsl:comment>Topichead: ancestor = <xsl:value-of select="local-name(parent::*)"/>
			navtitle = <xsl:value-of select="@navtitle"/></xsl:comment>
		<xsl:if test='*[contains(@class," map/topicref ")]'>
		<xsl:comment>Topichead: children = (<xsl:value-of select="local-name(child::*)"/>, *)
			navtitle = <xsl:value-of select="@navtitle"/> (use for-each to scan 'count(nodes)')</xsl:comment>
				<xsl:apply-templates select='*[contains(@class," map/topicref ")]'/>
		</xsl:if>
	</xsl:template>


	<!-- ============= recursive topicrefs (heart of transforms)=============== -->

	<xsl:template name='topicref' match='*[contains(@class," map/topicref ")][@format="dita" or not(@format)]'>
		<!-- get a bunch of variable content up front as global values to use later -->
	    <xsl:variable name="topicref_nesting">
	      <xsl:value-of select='count(ancestor-or-self::*[contains(@class," map/topicref ")])'/>
	    </xsl:variable>
		<!-- parse the href so that we can peek here and there -->
		<xsl:variable name='prepath'>
			<xsl:choose>
				<xsl:when test='substring(@href, 1, 2) = "./"'>
					<xsl:value-of select='substring-after(@href,"./")'/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@href"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name='path'>
			<xsl:choose>
				<xsl:when test='contains($prepath,"#") and (substring-before($prepath,"#")="")'>
					<xsl:value-of select='substring-before($prepath,"#")'/>
				</xsl:when>
				<xsl:when test='contains($prepath,"#")'>
					<xsl:value-of select='substring-before($prepath,"#")'/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select='$prepath'/>
				</xsl:otherwise>
			</xsl:choose>		
		</xsl:variable>

		<!-- load the referenced topic into processor for drilldown processing -->
		<xsl:variable name='tempdoc' select='document($path,.)'/>

		<!-- 
			Using choose logic to select how to process the different kinds of endponts possible on topicrefs: 
			ie, topics, other maps, links, etc.).
		-->
		<xsl:choose>
			<!-- Is this a reference to another map? (these conditions are not yet adapted for oManual use case) -->
			<xsl:when test="contains($path,'.ditamap')">
				<xsl:choose>
					<!-- If so, is it a mapref? -->
					<xsl:when test="@format = 'ditamap'">
						<!--Is a nested map.-->
						<xsl:comment>-{is_nested_map}</xsl:comment>
						<xsl:element name="h{$topicref_nesting}">
							<xsl:attribute name="class">topictitle<xsl:value-of select="$topicref_nesting"/></xsl:attribute>
							<xsl:if test="$GENERATE-OUTLINE-NUMBERING='yes'">
								<xsl:number level="multiple" format="1.1" count='*[contains(@class," map/topicref ")]'/><xsl:text>. </xsl:text>
							</xsl:if>
							<xsl:apply-templates select='@navtitle'/>
						</xsl:element>
						<p><span style="color:red;">Nested Map:<xsl:value-of select="@href"/></span></p>
						<!--xsl:apply-templates select='$tempdoc' mode="nestedmap"/-->
					</xsl:when>
					<!-- If not a mapref, it must be a reference instead. -->
					<xsl:otherwise>
						<!--Is a referenced-only map.-->
						<xsl:comment>-{is_ref-only_map}</xsl:comment>
						<xsl:element name="h{$topicref_nesting}">
							<xsl:attribute name="class">topictitle<xsl:value-of select="$topicref_nesting"/></xsl:attribute>
							<xsl:if test="$GENERATE-OUTLINE-NUMBERING='yes'">
								<xsl:number level="multiple" format="1.1" count='*[contains(@class," map/topicref ")]'/><xsl:text>. </xsl:text>
							</xsl:if>
							<xsl:apply-templates select='@navtitle'/>
						</xsl:element>
						<p><span style="color:red;">Filename: <xsl:value-of select="@href"/></span></p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			
			<!-- Is this a reference to a composite DITA topic? (this use case will require walking the nested content) -->
			<xsl:when test="name($tempdoc/*[1]) = 'dita'">
				<!-- is a composite topic -->
				<xsl:comment>-{is_composite_topic}</xsl:comment>
				<xsl:apply-templates select='$tempdoc/*' mode='nested'/>
				<!-- anticipate recursion -->
			</xsl:when>

			
			<!-- Fall through to the normal case of actual topics comprising an oManual manifest of guides/topics. -->
			<xsl:otherwise>
				<!-- is a topic of type $topicType -->
 				<xsl:variable name="topicType" select="name($tempdoc/*)" />
		
				<!-- Processing note:
					At this point, we have a topic in the variable $tempdoc and we know its type. 
					We can get the title and can generate a category entry for this guide.
					When we call the named-template for this topic type, we leave the current map context, 
					so do all look-ahead topic attribute processing here.
					Some of this data will be used only if the topic is a task.
				-->

				<!-- Build some values to insert into the procedure templates -->
				<xsl:variable name="thistitle">
					<xsl:apply-templates select='$tempdoc/*[contains(@class," topic/topic ")]/*[contains(@class," topic/title ")]' />
				</xsl:variable>
				<!-- hash an id from the title by normalizing characters and using lower case -->
				<xsl:variable name="namespace"></xsl:variable>
				<xsl:variable name="spacedash1"><xsl:value-of select="translate($thistitle,' - ','_')"/></xsl:variable>
				<xsl:variable name="spacedash"><xsl:value-of select="translate($spacedash1,' ','-')"/></xsl:variable>
				<xsl:variable name="hashid"><xsl:value-of select="$namespace"/><xsl:value-of select="translate($spacedash, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/></xsl:variable>
				<xsl:variable name="thisid">
					<xsl:choose>
						<xsl:when test="$tempdoc/@id !=''">
							<xsl:value-of select="$tempdoc/@id"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select='$hashid' />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="thisfn">guide_<xsl:value-of select="$thisid"/>.xml</xsl:variable>
				<xsl:variable name="thislang">
					<xsl:choose>
						<xsl:when test="@xml:lang !=''">
							<xsl:value-of select="@xml:lang"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>en</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<!-- How to handle URLs that are normally resolved at publishing time:

					From Tim Asp: The URL element is not required and shouldn't be included unless 
					there is an online version of the guide/topic. 
					When we import the omanual package, we will generate these fields.
				-->

				<!-- Build the reference wrapper for the manifest. -->
				<!-- All assets should be listed here; we are only processing guides and categories.-->
				
				<!-- Future possibility: support maprefs as "sub categories" (Q: should these be links to new assets?) -->
				
				<!-- Generate the reference for the manifest (this result set flows to stdout) -->


				<!-- What we do next depends on whether it is a task or not. -->
 				<xsl:choose>
 					<xsl:when test="$topicType = 'topic'">
						<xsl:call-template name="output-message">
							<xsl:with-param name="msgnum">000</xsl:with-param>
							<xsl:with-param name="msgsev">I</xsl:with-param>
							<xsl:with-param name="msgparms">src=<xsl:value-of select="@href"/></xsl:with-param>
							<xsl:with-param name="msg">Skipping topic (src=<xsl:value-of select="@href"/>)</xsl:with-param>
						</xsl:call-template>
 					</xsl:when>
 					<xsl:when test="$topicType = 'concept'">
						<xsl:call-template name="output-message">
							<xsl:with-param name="msgnum">001</xsl:with-param>
							<xsl:with-param name="msgsev">I</xsl:with-param>
							<xsl:with-param name="msgparms">src=<xsl:value-of select="@href"/></xsl:with-param>
							<xsl:with-param name="msg">Skipping concept (src=<xsl:value-of select="@href"/>)</xsl:with-param>
						</xsl:call-template>
 					</xsl:when>
 					<xsl:when test="$topicType = 'reference'">
						<xsl:call-template name="output-message">
							<xsl:with-param name="msgnum">002</xsl:with-param>
							<xsl:with-param name="msgsev">I</xsl:with-param>
							<xsl:with-param name="msgparms">src=<xsl:value-of select="@href"/></xsl:with-param>
							<xsl:with-param name="msg">Skipping reference (src=<xsl:value-of select="@href"/>)</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
 					<xsl:when test="not(@href)">
						<xsl:call-template name="output-message">
							<xsl:with-param name="msgnum">003</xsl:with-param>
							<xsl:with-param name="msgsev">I</xsl:with-param>
							<xsl:with-param name="msgparms">name=<xsl:value-of select="name()"/></xsl:with-param>
							<xsl:with-param name="msg">Skipping a grouping topicref (name=<xsl:value-of select="name()"/>)	</xsl:with-param>
						</xsl:call-template>
 					</xsl:when>
 					<xsl:otherwise>
						<xsl:call-template name="output-message">
							<xsl:with-param name="msgnum">004</xsl:with-param>
							<xsl:with-param name="msgsev">I</xsl:with-param>
							<xsl:with-param name="msgparms">filename=<xsl:value-of select="$outputpath"/>/<xsl:value-of select="$thisfn"/> (src=<xsl:value-of select="@href"/>)</xsl:with-param>
							<xsl:with-param name="msg">Outputting filename=<xsl:value-of select="$outputpath"/>/<xsl:value-of select="$thisfn"/> (src=<xsl:value-of select="@href"/>)</xsl:with-param>
						</xsl:call-template>
						<!-- generate the oManual equivalent of a reference to this guide... -->
						<xsl:call-template name="summarizeGuide">
							<xsl:with-param name="thisdoc" select="$tempdoc"/>
							<xsl:with-param name="thislang" select="$thislang"/>
							<xsl:with-param name="thistitle" select="$thistitle"/>
							<xsl:with-param name="thisid" select="$thisid"/>
							<xsl:with-param name="thisfn" select="$thisfn"/>
						</xsl:call-template>
						<!-- then generate the external file version of the transformed task. -->
				    	<xsl:result-document href="{$outputpath}/{$thisfn}" method="xml">
							<xsl:call-template name="chunkGuide">
								<xsl:with-param name="thisdoc" select="$tempdoc"/>
								<xsl:with-param name="thislang" select="$thislang"/>
								<xsl:with-param name="thistitle" select="$thistitle"/>
								<xsl:with-param name="thisid" select="$thisid"/>
								<xsl:with-param name="thisfn" select="$thisfn"/>
							</xsl:call-template>
						</xsl:result-document>
 					</xsl:otherwise>
 				</xsl:choose>

			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test='*[contains(@class," map/topicref ")]'><!-- recurse through child topicrefs (reenter main template) -->
			<xsl:apply-templates select='*[contains(@class," map/topicref ")]'/>
		</xsl:if>
	</xsl:template>

	<xsl:template match='*[contains(@class," map/topicref ")]' mode="childref">
		<xsl:apply-templates select="placebo"/>
	<!-- name: <xsl:value-of select="name()"/> @href=<xsl:value-of select="@href"/>-->
	</xsl:template>
	
	<xsl:template match='*[contains(@class," map/topicref bookmap/toc ")]' priority='2'>
		<!-- Toc: @class=<xsl:value-of select="@class"/> -->
	</xsl:template>

	
</xsl:stylesheet>
