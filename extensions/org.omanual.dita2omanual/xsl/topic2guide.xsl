<?xml version='1.0'?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="xsi"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
>

<!-- 
| ***Note on how to convert a schema into DTD for tools requiring that format (xsd2dtd is from Syntext's old site)***
| C:\DITA-OT1.5.3>java -jar lib\saxon\saxon9.jar omanual_procedure_0.3.xsd xsd2dtd.xsl > omanual.dtd
+-->

	<!-- pick up some expeDITA utility functions -->
	<!--xsl:import href="utilities.xsl"/-->
	
	<!--xsl:strip-space elements="body map"/-->
	<xsl:preserve-space elements="pre screen lines"/> 

	<!-- parameters that can be defined externally -->
	

	<!-- set the result tree (output) encoding -->
	<xsl:output method="xml"
	            encoding="utf-8"
	            indent="yes"
	 />

	<!-- All values needed here should have been created as globals by the calling context. -->
	

	<!-- The goal for this conversion is getting as much information from the DITA document 
  		into the Dozuki system as easily as possible.
  		Therefore use pull templates to model the full schema, even if some elements could be empty. 
  	-->
  	<!--	Unused for image; Dozuki install will put this in.
				large="{$guide_file_path}/{$guide_image_filename}.large" 
				medium="{$guide_file_path}/{$guide_image_filename}.medium" 
				mini="{$guide_file_path}/{$guide_image_filename}.mini" 
				standard="{$guide_file_path}/{$guide_image_filename}.standard" 
				thumbnail="{$guide_file_path}/{$guide_image_filename}.thumbnail"
	-->

	<xsl:template name="summarizeGuide">
		<!-- get the topic data that was passed in from the map or task context -->
		<xsl:param name="thisdoc"/>
		<xsl:param name="thislang"/>
		<xsl:param name="thistitle"/>
		<xsl:param name="thisid"/>
		<xsl:param name="thisfn"/>

		<xsl:param name="guide_default_type"></xsl:param>
        <xsl:param name="guide_default_image_filename"></xsl:param>

		<!-- (Dev note: this is duplicated function (see other guide context); can we put it into a call-template? )
		These values are not normally available or obvious in DITA content. Options:
			o pass single generic value by param to override empty defaults or
			o query from document if available (preferred, but there is normally no exact DITA equivalent)
		-->


		<!-- These values are constructed by query of passed-in values -->
        <xsl:variable name="guide_media_path"><xsl:value-of select="$file_path"/></xsl:variable>
		<xsl:variable name="guide_file_path"><xsl:value-of select="$file_path"/><xsl:value-of select="$thisfn"/></xsl:variable>
		<xsl:variable name="guide_rest_path"><xsl:value-of select="$REST_path"/><xsl:value-of select="$thisfn"/></xsl:variable>

        <xsl:variable name="guide_image_filename">
        	<xsl:choose>
        		<xsl:when test='$thisdoc//*[contains(@class," topic/image ")][@outputclass = "banner"]'>
        			<!-- select the specifically identified banner image href -->
					<xsl:apply-templates select='$thisdoc//*[contains(@class," topic/image ")][@outputclass = "banner"]/@href' mode="bannerimg"/>
       			</xsl:when>
       			<xsl:when test='$thisdoc//*[contains(@class," topic/image ")]'>
        			<!-- select the first image href as a hail mary pass -->
					<xsl:apply-templates select='$thisdoc//*[contains(@class," topic/image ")][1]/@href' mode="bannerimg"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- use passed in param value (null string fallback) -->
					<xsl:value-of select="$guide_default_image_filename"/>
				</xsl:otherwise>
			</xsl:choose>
        </xsl:variable>
        <xsl:variable name="guide_type">
        	<!-- DITA lacks any better semantic for differentiating guide roles. Until we come up with a better source convention:  -->
        	<xsl:choose>
        		<xsl:when test='$thisdoc//*[contains(@class," task/task ")][@outputclass]'>
        			<!-- If the task was classed with an apparent role, use it. -->
					<xsl:value-of select='$thisdoc//*[contains(@class," task/task ")]/@outputclass'/>
       			</xsl:when>
       			<!-- else use passed in param -->
				<xsl:otherwise>
					<!-- use passed in param value (null string fallback) -->
					<xsl:value-of select="$guide_default_type"/>
				</xsl:otherwise>
			</xsl:choose>
       </xsl:variable>

		<!-- view -->
		<guide	id="{$thisid}" 
				subject="{$thistitle}" 
				type="{$guide_type}">
			<url><xsl:value-of select="$guide_rest_path"/></url>
			<title><xsl:value-of select="$thistitle"/></title>
			<image>
				<xsl:value-of select="$guide_media_path"/><xsl:value-of select="$guide_image_filename"/>
			</image>
			<path><xsl:value-of select="$guide_file_path"/></path>
		</guide>
	</xsl:template>


	<xsl:template name="chunkGuide">
		<!-- get the topic data that was passed in from the map or task context -->
		<xsl:param name="thisdoc"/>
		<xsl:param name="thislang"/>
		<xsl:param name="thistitle"/>
		<xsl:param name="thisid"/>
		<xsl:param name="thisfn"/>

		<xsl:param name="guide_default_type"></xsl:param>
        <xsl:param name="guide_default_image_filename"></xsl:param>

		<!-- These values are constructed by query of passed-in values -->
        <xsl:variable name="guide_media_path"><xsl:value-of select="$file_path"/></xsl:variable>
		<xsl:variable name="guide_file_path"><xsl:value-of select="$file_path"/><xsl:value-of select="$thisfn"/></xsl:variable>
		<xsl:variable name="guide_rest_path"><xsl:value-of select="$REST_path"/><xsl:value-of select="$thisfn"/></xsl:variable>

		<!-- (Dev note: this is duplicated function (see other guide context); can we put it into a call-template? )
		These values are not normally available or obvious in DITA content. Options:
			o pass single generic value by param to override empty defaults or
			o query from document if available (preferred, but there is normally no exact DITA equivalent)
		-->
        <xsl:variable name="guide_image_filename">
        	<xsl:choose>
        		<xsl:when test='$thisdoc//*[contains(@class," topic/image ")][@outputclass = "banner"]'>
        			<!-- select the specifically identified banner image href -->
					<xsl:apply-templates select='$thisdoc//*[contains(@class," topic/image ")][@outputclass = "banner"]/@href' mode="bannerimg"/>
       			</xsl:when>
       			<xsl:when test='$thisdoc//*[contains(@class," topic/image ")]'>
        			<!-- select the first image href as a hail mary pass -->
					<xsl:text>[This template is executing 3 times.]</xsl:text>
					<!--xsl:apply-templates select='$thisdoc//*[contains(@class," topic/image ")][1]/@href' mode="bannerimg"/-->
				</xsl:when>
				<xsl:otherwise>
					<!-- use passed in param value (null string fallback) -->
					<xsl:value-of select="$guide_default_image_filename"/>
				</xsl:otherwise>
			</xsl:choose>
        </xsl:variable>
        <xsl:variable name="guide_type">
        	<!-- DITA lacks any better semantic for differentiating guide roles. Until we come up with a better source convention:  -->
        	<xsl:choose>
        		<xsl:when test='$thisdoc//*[contains(@class," task/task ")][@outputclass]'>
        			<!-- If the task was classed with an apparent role, use it. -->
					<xsl:value-of select='$thisdoc//*[contains(@class," task/task ")]/@outputclass'/>
       			</xsl:when>
       			<!-- else use passed in param -->
				<xsl:otherwise>
					<!-- use passed in param value (null string fallback) -->
					<xsl:value-of select="$guide_default_type"/>
				</xsl:otherwise>
			</xsl:choose>
       </xsl:variable>

		<guide	id="{$thisid}"
				locale="{$thislang}" 
				xmlns="http://omanual.com" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xsi:schemaLocation="http://omanual.com/openmanual_0.2.xsd"
				>
	
			<!--xs:element ref="title" /-->
			<title><xsl:value-of select='$thistitle'/></title>
	
            <!--xs:element ref="summary" /-->
            <!-- DITA semantic: short description. text-only, no more than 255 characters. Solution: copy first 255 chars of shortdesc text. -->
			<summary>
				<xsl:value-of select='substring($thisdoc/*/*[contains(@class," topic/shortdesc ")]/., 1, 255)'/>
				<!-- test: what happens if shortdesc is missing or less than 255 chars without markup? -->
			</summary>
	
			<!-- 
				The image field of a category represents the banner image.  
				Dozuki import will do the size generation as part of the import process, 
				so authoring best practice is to cite the largest image size available. 
			-->
            <!--xs:element ref="image" /-->
			<image>
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">005</xsl:with-param>
					<xsl:with-param name="msgsev">W</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">Banner image, a local image, empty string if not specified.</xsl:with-param>
				</xsl:call-template>
				<!-- ff: Needs to be specifically identified in DITA as a banner resource; generating a dummy content for find/replace. -->
				<xsl:value-of select="$guide_media_path"/><xsl:value-of select="$guide_image_filename"/>
			</image>
	
            <!--xs:element ref="author" /-->
			<author id="1">
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">006</xsl:with-param>
					<xsl:with-param name="msgsev">W</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">Author. Please identify an author (and corresponding @id).</xsl:with-param>
				</xsl:call-template>
				<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/author ")][1]'/>
			</author>
	
            <!--xs:element ref="time_required" /-->
			<time_required>
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">007</xsl:with-param>
					<xsl:with-param name="msgsev">W</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">time_required. Please fill in a suggested value.</xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="'{time required}'"/>
			</time_required>
	
            <!--xs:element ref="difficulty" /-->
			<difficulty>
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">008</xsl:with-param>
					<xsl:with-param name="msgsev">W</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">difficulty. is audience a possibly useful hint? DITA does not specifically capture this rating.</xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="'{Easy (or not)}'"/>
			</difficulty>
	
            <!--xs:element ref="category" /-->
			<category>
				<xsl:call-template name="output-message">
					<xsl:with-param name="msgnum">009</xsl:with-param>
					<xsl:with-param name="msgsev">W</xsl:with-param>
					<xsl:with-param name="msgparms"></xsl:with-param>
					<xsl:with-param name="msg">category. map to prolog/metadata/category for now (note that DITA allows multiples)</xsl:with-param>
				</xsl:call-template>
				<xsl:apply-templates select='$thisdoc/*/prolog/metadata/*[contains(@class," topic/category ")][1]'/>
			</category>
	
            <!--xs:element ref="introduction" /-->
            <!-- DITA semantic: short description mapped to simplifiedHTML. -->
			<introduction>
				<!-- Note that this media converter uses different queries than the media generator for the step element. -->
				<!-- Also, media is not required for the introduction, so this is a forced condition due to DITA to oManual non alignment. -->
				<media><!-- image, video, embed -->
					<!-- Logic: set the type based on first allowed content type. Must be query driven. -->
					<xsl:choose>
						<xsl:when test='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/image'>
							<xsl:attribute name="type">image</xsl:attribute>
							<!-- up to 3 images are allowed; can we issue a message if more than 3? -->
							<!-- pulling first if any image as peer to lines -->
				 			<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/image[1]' mode="aslines"/>
				 			<!-- test: need to use named templates to ensure we catch ONLY the 2nd and 3rd image, if extant. Current pattern rematches first image multiple times! -->
				 			<!--
				 			<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/image[2]' mode="aslines"/>
				 			<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/image[3]' mode="aslines"/>
				 			-->
						</xsl:when>
						<xsl:when test='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/object'>
							<xsl:attribute name="type">video</xsl:attribute>
		 					<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/object[1]' mode="aslines"/><!-- pulling first if any object as peer to lines -->
						</xsl:when>
						<xsl:when test='$thisdoc/*/*[contains(@class," topic/shortdesc ")]/embed'>
							<xsl:attribute name="type">embed</xsl:attribute>
							<!-- This is the "anything but image or object" place. Island of Misfit Toys. -->
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="type">embed</xsl:attribute>
							<!-- This is literally the "has no embedded media" fallthrough, if the previous one does not catch something. -->
							<!-- media requires at least one of something, so we'll use one of "embed" to make validator happy. -->
						</xsl:otherwise>
					</xsl:choose>
					<!-- then query the step for any media, and place those references here. -->
		 			<!-- If more than 3 images in a query nodeset, issue a reminder message about limits. Ideally, use schema to limit authors.-->
				</media>
				<xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/shortdesc ")]' mode="noimage"/>
			</introduction>
	
            <!--xs:element ref="tools" /-->
			<tools><xsl:comment>tools:no analog</xsl:comment>
				<xsl:value-of select="'{tools}'"/>
			</tools>
	
            <!--xs:element ref="parts" /-->
			<parts><xsl:comment>tools:no analog</xsl:comment>
				<xsl:value-of select="'{parts}'"/>
			</parts>
	
            <!--xs:element ref="flags" /-->
			<flags><xsl:comment>tools:no analog</xsl:comment>
				<xsl:value-of select="'{flags}'"/>
			</flags>
	
            <!--xs:element ref="documents" /-->
			<documents><xsl:comment>tools:no analog</xsl:comment>
				<xsl:value-of select="'{documents}'"/>
			</documents>

            <!--xs:element ref="prerequisites"/-->
            <!-- oManual semantic: A collection of guides that must be completed prior to starting this guide. -->
            <!-- DITA semantic: no direct analog; might need to generate a result-document as a new guide,
            	using task/prereqs mapped to simplifiedHTML. -->
			<prerequisites>
				<prerequisite id="prereqid" locale="{$thislang}" path="{$file_path}/some_prereq_path.xml">
					<!-- ideally, this content should be the target guide's title. content will be inlined at rendering. -->
					<xsl:apply-templates select='$thisdoc/*/*[contains(@class," task/prereqs ")]'/>
				</prerequisite>
			</prerequisites>
	
            <!--xs:element ref="steps"/-->
			<xsl:apply-templates select='$thisdoc/*/*/steps-unordered'/>
			<xsl:apply-templates select='$thisdoc/*/*/steps-informal'/>
			<xsl:apply-templates select='$thisdoc/*/*/steps'/>
	
            <!--xs:element ref="conclusion"/-->
			<conclusion>
				<xsl:comment>Task: Result</xsl:comment>
				<div><xsl:value-of select='$thisdoc/*/*[contains(@class," topic/result ")]'/></div>

				<xsl:comment>Task: Example</xsl:comment>
				<div><xsl:apply-templates select='$thisdoc/*/*[contains(@class," topic/example ")]'/></div>

				<xsl:comment>Task: Postreq</xsl:comment>
				<div><xsl:value-of select='$thisdoc/*/*[contains(@class," topic/postreq ")]'/></div>
			</conclusion>

            <!--xs:element ref="modified_date" /-->

            <!--xs:element ref="created_date" /-->

		</guide>
	</xsl:template>

	<!-- For oManual, steps need to be reduced to blocks (called "lines"), object, or image result containers. -->
	<!-- Can be done with high conformance to oManual if using "pulls" into each of the three containers,
	     but using fall-through can result in first-level result elements that are NOT among those three.
	     If a paragraph contains an image, it cannot logically be part of a p>line content mapping.
	-->

	<xsl:template match='*[contains(@class," task/steps-informal ")]' priority="2">
		<steps xmlns="http://omanual.com">
			<!-- In DITA, content for this element is essentially anything allowed by a section. 
			-->
			<xsl:apply-templates/>
		</steps>
	</xsl:template>

	<xsl:template match='*[contains(@class," task/steps ")] | *[contains(@class," task/steps-unordered ")]' priority="2">
		<steps xmlns="http://omanual.com">
				<xsl:apply-templates/>
		</steps>
	</xsl:template>

	<xsl:template match='*[contains(@class," task/step ")]' priority="2">
		<xsl:variable name="stepcnt"><xsl:number/></xsl:variable>
		<step xmlns="http://omanual.com" number="{$stepcnt}" title="some title">
			<!--  line, object, and image elements -->
			<!-- get everything  but the media; toss away fallthrough step -->
			<lines>
 				<xsl:apply-templates select="title" mode="aslines"/><!-- force title to go first, if present -->
 				<xsl:apply-templates select="p | note" mode="aslines"/>
				<xsl:apply-templates select="cmd | info" mode="aslines"/>
			</lines>
			<media><!-- image, video, embed -->
				<!-- Logic: set the type based on first allowed content type. Must be query driven. -->
				<xsl:choose>
					<xsl:when test='descendant::image'>
						<xsl:attribute name="type">image</xsl:attribute>
						<!-- up to 3 images are allowed; can we issue a message if more than 3? -->
			 			<xsl:apply-templates select="descendant::image[1]" mode="aslines"/><!-- pulling first if any image as peer to lines -->
			 			<xsl:apply-templates select="descendant::image[2]" mode="aslines"/><!-- pulling second if any image as peer to lines -->
			 			<xsl:apply-templates select="descendant::image[3]" mode="aslines"/><!-- pulling third if any image as peer to lines -->
					</xsl:when>
					<xsl:when test='descendant::object'>
						<xsl:attribute name="type">video</xsl:attribute>
	 					<xsl:apply-templates select="descendant::object[1]" mode="aslines"/><!-- pulling first if any object as peer to lines -->
					</xsl:when>
					<xsl:when test='descendant::embed'>
						<xsl:attribute name="type">embed</xsl:attribute>
						<!-- This is the "anything but image or object" place. Island of Misfit Toys. -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="type">embed</xsl:attribute>
						<!-- This is literally the "has no embedded media" fallthrough, if the previous one does not catch something. -->
						<!-- media requires at least one of something, so we'll use one of "embed" to make validator happy. -->
					</xsl:otherwise>
				</xsl:choose>
				<!-- then query the step for any media, and place those references here. -->
	 			<!-- If more than 3 images in a query nodeset, issue a reminder message about limits. Ideally, use schema to limit authors.-->
			</media>
		</step>
	</xsl:template>

	<xsl:template name="gen_media_element">
			<media><!-- image, video, embed -->
				<!-- Logic: set the type based on first allowed content type. Must be query driven. -->
				<xsl:choose>
					<xsl:when test='descendant::image'>
						<xsl:attribute name="type">image</xsl:attribute>
						<!-- up to 3 images are allowed; can we issue a message if more than 3? -->
			 			<xsl:apply-templates select="descendant::image[1]" mode="aslines"/><!-- pulling first if any image as peer to lines -->
			 			<xsl:apply-templates select="descendant::image[2]" mode="aslines"/><!-- pulling second if any image as peer to lines -->
			 			<xsl:apply-templates select="descendant::image[3]" mode="aslines"/><!-- pulling third if any image as peer to lines -->
					</xsl:when>
					<xsl:when test='descendant::object'>
						<xsl:attribute name="type">video</xsl:attribute>
	 					<xsl:apply-templates select="descendant::object[1]" mode="aslines"/><!-- pulling first if any object as peer to lines -->
					</xsl:when>
					<xsl:when test='descendant::embed'>
						<xsl:attribute name="type">embed</xsl:attribute>
						<!-- This is the "anything but image or object" place. Island of Misfit Toys. -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="type">embed</xsl:attribute>
						<!-- This is literally the "has no embedded media" fallthrough, if the previous one does not catch something. -->
						<!-- media requires at least one of something, so we'll use one of "embed" to make validator happy. -->
					</xsl:otherwise>
				</xsl:choose>
				<!-- then query the step for any media, and place those references here. -->
	 			<!-- If more than 3 images in a query nodeset, issue a reminder message about limits. Ideally, use schema to limit authors.-->
			</media>
	</xsl:template>

	<xsl:template match='*[contains(@class," topic/image ")]' mode="aslines">
			<image xmlns="http://omanual.com"><xsl:value-of select="@href"/></image>
			<!-- Ideally should pass @href through a path/URL verifier/converter. 
			ie, {$guidename}-{$guideid}/@href (ie, possibly use Ant or params to pass in this value from checkin) -->
	</xsl:template>

	<xsl:template match="object" mode="aslines">
		<!-- The media container should not be repeated, but it should not be created empty either. Needs work. -->
		<!-- This needs work to match DITA object parts to required oEmbed endpoints. -->
		<embed version="1.0"
			type="{@type}"
			provider_url="{@codebase}"
			>
		</embed>
	</xsl:template>

	<xsl:template match="p | note | title | cmd | info" mode="aslines">
		<!-- Generally no longer than 350 characters. Can we handle longer source as splitting somehow? -->
		<line xmlns="http://omanual.com"><xsl:apply-templates mode="aslines"/></line>
	</xsl:template>

	<!-- calls to these container elements simply pass through; the container is "invisible" -->
	<xsl:template match='*[contains(@class," topic/example ")]'>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match='*[contains(@class," task/result ")]'>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match='*[contains(@class," task/postreq ")]'>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="title">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="shortdesc">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- This moded rule is called from the guide intro, therefore should instance only once, and only the href. -->
	<xsl:template match='*[contains(@class," topic/image ")][1]' mode="bannerimg">
		<!-- for this mode, retrieve only the local path of the image. -->
		<xsl:value-of select="@href"/>
	</xsl:template>

	<!-- This moded rule is called from introduction. -->
	<xsl:template match='*[contains(@class," topic/shortdesc ")]' mode="noimage">
		<!-- Retrieve all but image content. -->
		<xsl:apply-templates select="node()[name()!='image']"/>
	</xsl:template>

	<!-- turn off these elements; they never drive output: -->
	<xsl:template match='*[contains(@class," topic/shortdesc ")]'/>

	<!-- Element matches placed here are for DITA body content that must be mapped into an available simplifiedHTML element:
		one of:
	      p | a | strong | em | h1 | h2 | h3 | h4 | h5 | h6 | tt | pre | code | ul | li | br | sub | sup | del | ins | div
	    and map DITA atts as possible into one of:
	      id | class | href | style | rel | title | target
	-->

	<!-- For DITA maps, this module maps DITA attributes to closest matching oManual HTML attributes. -->
	<!-- topicref-atts: collection-type, processing-role, type, scope, locktitle, format, linking, toc, print, search, chunk -->
	
	<!-- For DITA topics, this module maps DITA atts to closest matching oManual HTML atts. -->
	<!-- common: keyref, outputclass, class, xml:space (high candidates) -->
	<!-- unique issues: href, keys, keyref, con*, type, format, scope, role -->
	<!-- display-atts: scale, frame, expanse (possible mappings) -->
	<!-- global-atts: xtrf, xtrc (not applicable in the om architecture) -->
	<!-- id-atts: id, conref, conrefend, conaction, conkeyref (other than id, rest are consumed by processing) -->
	<!-- select-atts: props, base, platform, product, audience, otherprops, importance, rev, status (inspect) -->
	<!-- localization-atts: translate, xml:lang, dir (utilize xml:lang for locale) -->
	<!-- relational-atts: type, format, scope, role, otherrole (inspect) -->
	<xsl:template name="checkHTMLatts">
		<!-- Note that we are processing DITA attributes in terms of the allowed HTML result subset. -->
		<xsl:if test="@id !=''">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
		<xsl:if test="@outputclass !=''">
				<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute></xsl:if>
		<xsl:if test="@href !=''">
				<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute></xsl:if>
				
		<!-- These are placeholders for the result values; the test names are NOT YET mapped DITA att names! -->
		<xsl:if test="@style !=''">
				<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute></xsl:if>
		<xsl:if test="@rel !=''">
				<xsl:attribute name="rel"><xsl:value-of select="@rel"/></xsl:attribute></xsl:if>
		<xsl:if test="@title !=''">
				<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute></xsl:if>
		<xsl:if test="@target !=''">
				<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute></xsl:if>
	</xsl:template>

	<!-- allowed "simplifiedHTML" content, from github version .04 schema -->
	<!-- Note that *(dash)(dash) indicates a reasonably tested output, does not need to be rehashed for now. -->

	<!-- p *-->
	<xsl:template match='*[contains(@class," topic/p ")]'>
		<p xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<!-- a -->
	<xsl:template match='*[contains(@class," topic/a ")]'>
		<a xmlns="http://omanual.com">
			<!-- need to ensure that href syntax is mapped properly per @format rules;
				grab link content per DITA processing results based on map conditions -->
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	
	<!-- strong *-->
	<xsl:template match='*[contains(@class," hi-d/b ")]'>
		<strong xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	
	<!-- em *-->
	<xsl:template match='*[contains(@class," hi-d/i ")]'>
		<em xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</em>
	</xsl:template>
	
	<!-- h1 -->
	<!-- h2 -->
	<!-- h3 -->
	<!-- h4 -->
	<!-- h5 -->
	<!-- h6 -->
	<xsl:template match='*[contains(@class," topic/title ")]'>
		<xsl:variable name="hdlvl">
	      <xsl:value-of select='count(ancestor-or-self::*[contains(@class," topic/topic ")]/*[contains(@class," topic/title ")])'/>
	    </xsl:variable>
	    <!-- QUESTION: Can this level ever *reasonably* descend past 6? Should it descend from a display context level? -->
	    <!-- NOTE: We discussed the option of using an offset value to slide this presentation up or down with respect to
	    	a presumed display context (if the page heading is h1, let the block content start at h2, etc.)
	    -->
	   <!-- A: There shouldn't ever be a level lower than 6.  If there are h1 elements
	        in the introduction, conclusion or content fields, we'll "slide" them 
	        down to h2 as part of the import process - I don't think you need to worry about that. -->
		<xsl:element name="h{$hdlvl}" xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	
	<!-- tt *-->
	<xsl:template match='*[contains(@class," hi-d/tt ")]'>
		<tt xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</tt>
	</xsl:template>
	
	<!-- pre *-->
	<xsl:template match='*[contains(@class," topic/pre ")]'>
		<pre xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</pre>
	</xsl:template>
	
	<!-- code *-->
	<xsl:template match='*[contains(@class," pr-d/codeblock ")]'>
		<code xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</code>
	</xsl:template>
	
	<!-- ul *-->
	<xsl:template match='*[contains(@class," topic/ul ")]'>
		<ul xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	
	<!-- li *-->
	<xsl:template match='*[contains(@class," topic/li ")]'>
		<li xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	
	<!-- br *-->
	<xsl:template match='*[contains(@class," topic/null ")]'><!-- No semantic equivalent -->
		<br xmlns="http://omanual.com" />
	</xsl:template>
	
	<!-- sub *-->
	<xsl:template match='*[contains(@class," hi-d/sub ")]'>
		<sub xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>
	
	<!-- sup *-->
	<xsl:template match='*[contains(@class," hi-d/sup ")]'>
		<sup xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</sup>
	</xsl:template>
	
	<!-- del *-->
	<xsl:template match='*[contains(@class," topic/null ")]'><!-- No semantic equivalent -->
		<del xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</del>
	</xsl:template>
	
	<!-- ins *-->
	<xsl:template match='*[contains(@class," topic/null ")]'><!-- No semantic equivalent -->
		<ins xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</ins>
	</xsl:template>
	
	<!-- div *-->
	<xsl:template match='*[contains(@class," topic/section ")] | *[contains(@class," topic/example ")]'>
		<div xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	
	
	
	
	<!-- Templates for DITA content for which there are no direct mappings in oManual markup. -->
	<!-- Fallthrough processing will handle reasonable support for domains for now. 
		 These templates represent where more case-specific add-on work can be done.
	-->
	
	<!-- Definition list: -->
	<xsl:template match='*[contains(@class," topic/dl ")]'>
		<!-- NOTE: oM lacks a dl target; convert in ul with bolded term -->
		<ul xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	
	<xsl:template match='*[contains(@class," topic/dlentry ")]'>
		<li xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	
	<xsl:template match='*[contains(@class," topic/dt ")]'>
		<strong xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	
	<xsl:template match='*[contains(@class," topic/dd ")]'>
		<!-- A paragraph within list item mimics a definition list's dd container. -->
		<p xmlns="http://omanual.com">
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match='*[contains(@class," topic/table ")]'>
	<!-- Not specifically supported yet; there is no direct equivalent in oManual's HTML subset.
		A workaround would be to utilize the text-based table code from DITA OT's man page outproc.
		DITA content writers should not use source markup that an oManual content author would not use. -->
	</xsl:template>
	
	<xsl:template match='*[contains(@class," topic/simpletable ")]'>
	<!-- Not specifically supported yet; there is no direct equivalent in oManual's HTML subset -->
	<!-- Note that some specializations of simpletable (not table) might fit into ul; need to determine case by case. -->
	</xsl:template>



</xsl:stylesheet>
