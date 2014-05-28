<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform  version="1.0" 
			xmlns:om ="http://omanual.com" 
			xmlns:ifx ="http://ifixit.com" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			xmlns:xs="http://www.w3.org/2001/XMLSchema"
			xmlns:fo="http://www.w3.org/1999/XSL/Format"
  			exclude-result-prefixes="om">

<xsl:output method="xml" indent="yes" />


<!-- "library" of common transforms -->

	<xsl:template name="topictitle">
	   <h1><xsl:apply-templates /></h1>
	</xsl:template>
	
	<xsl:template name="innertopictitle">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>

	<xsl:template name="topicinfo">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Topic Info</b><br/>
			<xsl:if test="@discontinued !=''">discontinued="<xsl:value-of select="@discontinued"/>"<br/></xsl:if>
			<xsl:if test="@introduced !=''">introduced="<xsl:value-of select="@introduced"/>"<br/></xsl:if>
			<xsl:if test="@manufacturer !=''">manufacturer="<xsl:value-of select="@manufacturer"/>"<br/></xsl:if>
			<p><xsl:apply-templates /></p>
	    </div>
	</xsl:template>

	
	<xsl:template name="topicsteps">
		<b>Steps:</b><br/>
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="om:step">
   		<b style="color:purple;">Required @number: <xsl:value-of select="@number"/></b><br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
		<li>
			<b>Step: </b><xsl:apply-templates/>
		</li>
	</xsl:template>

	<xsl:template name="topiclines">
		<b>Lines:</b><br/>
		<ol>
			<xsl:apply-templates/>
		</ol>
	</xsl:template>

	<xsl:template match="om:line">
		<li>
		<xsl:for-each select="@*[not(. = '')]"><!-- is this a better test for null values? -->
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
			<xsl:apply-templates/>
		</li>
	</xsl:template>

	<xsl:template name="topicimages"><!-- this might be deprecated -->
		<div style="border: thin red solid;background:#fee;">
			<b style="font-size:larger;">meta: Images</b><br/>
			<xsl:for-each select="om:image">
			<!-- <image guid="JOMi1v5lvH4bM2Up" orderby="1">media/JOMi1v5lvH4bM2Up.jpg</image> -->
				<xsl:if test="@guid !=''">guid="<xsl:value-of select="@guid"/>"<br/></xsl:if>
				<xsl:if test="@orderby !=''">orderby="<xsl:value-of select="@orderby"/>"<br/></xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template name="topicimage">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Image Info</b><br/>
   			<b style="color:purple;">Required image:  if you do not have an additional primary image, duplicate the first image of the guide.</b><br/>
			<xsl:if test="@large !=''">large="<xsl:value-of select="@large"/>"<br/></xsl:if>
			<xsl:if test="@medium !=''">medium="<xsl:value-of select="@medium"/>"<br/></xsl:if>
			<xsl:if test="@standard !=''">standard="<xsl:value-of select="@standard"/>"<br/></xsl:if>
			<xsl:if test="@thumbnail !=''">thumbnail="<xsl:value-of select="@thumbnail"/>"<br/></xsl:if>
			<xsl:if test="@mini !=''">mini="<xsl:value-of select="@mini"/>"<br/></xsl:if>
			<!--
			<xsl:if test="@ !=''">="<xsl:value-of select="@"/>"<br/></xsl:if>
			<xsl:variable name="imgsrc"><xsl:apply-templates/></xsl:variable>
			<img src="{$imgsrc}"/>
			-->
		</div>
	</xsl:template>

	<xsl:template name="topicdescription">
		<!-- any: basic -->
		<p><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topicauthor">
		<p id="{@id}">Author: <xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topicdifficulty">
		<p>Difficulty: <xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topicmodifieddate">
		<p>Modified Date: <xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topiccreateddate">
		<p>Created Date: <xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topictimerequired">
		<p>Time required: <xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template name="topicflags">
		<div style="border: thin gray solid;background:#eee;">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

   <xsl:template match="om:flag">
   		<b style="color:purple;">Required @title: <xsl:value-of select="@title"/></b><br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
   </xsl:template>


	<xsl:template name="topicancestors">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Ancestors</b><br/>
			<xsl:apply-templates/> <!-- this element controls fall through to the local context -->
		</div>
	</xsl:template>

	<xsl:template name="om:ancestor">
		<xsl:apply-templates/><xsl:if test="not(position() = last())">, </xsl:if>
	</xsl:template>


	<xsl:template name="topicchildren">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Children</b><br/>
			<xsl:apply-templates/> <!-- this element controls fall through to the local context -->
		</div>
	</xsl:template>

	<xsl:template name="om:child">
		<xsl:apply-templates/><xsl:if test="not(position() = last())">, </xsl:if>
	</xsl:template>


	<xsl:template name="topicdocuments">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Documents</b><br/>
			<xsl:apply-templates/> <!-- this element controls fall through to the local context -->
		</div>
	</xsl:template>
	
	<xsl:template match="om:document">
   		<b style="color:purple;">Required @url: <xsl:value-of select="@url"/></b><br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="topicsolutions">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Solutions</b><br/>
			<xsl:if test="@count !=''">count="<xsl:value-of select="@count"/>"<br/></xsl:if>
			<xsl:if test="@url !=''">url="<xsl:value-of select="@url"/>"<br/></xsl:if>
		</div>
	</xsl:template>


	<xsl:template name="topicparts">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Parts</b><br/>
			
			<!-- QUESTION: which of these inner models is now current? -->
			<b>Part categories:</b><br/>
			<xsl:for-each select="om:part_category">
				<xsl:value-of select="."/><xsl:if test="not(position()=last())"><xsl:text>, </xsl:text></xsl:if>
			</xsl:for-each><br/>
			
			<b>Parts:</b><br/>
			<xsl:for-each select="om:part">
				<xsl:apply-templates select="om:part"/><xsl:if test="not(position()=last())"><hr/></xsl:if>
			</xsl:for-each>
   		</div>
	</xsl:template>
	
	<xsl:template match="om:part_category">
		<xsl:apply-templates/><xsl:if test="not(position()=last())"><xsl:text>, </xsl:text></xsl:if>
	</xsl:template>
	
	<xsl:template match="om:part">
		<p>
		<b style="color:purple;">Required @name: <xsl:value-of select="@name"/></b><br/>
		<b style="color:purple;">Required @quantity: <xsl:value-of select="@quantity"/></b><br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
		<xsl:apply-templates/>
		<!-- this apply templates should pull in external sources, etc. defined elsewhere -->
		</p>
	</xsl:template>


	<xsl:template name="topictools">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Tools</b><br/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="om:tool">
		<b style="color:purple;">Required @name: <xsl:value-of select="@name"/></b><br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="om:external_sources">external sources:<br/>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="om:external_source">external source:<br/>
		<xsl:for-each select="@*[not(. = '')]">
			<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="topicguides">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Guides</b><br/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="om:guide">
		<p>
   			<b style="color:purple;">Required @id: <xsl:value-of select="@id"/></b><br/>
	   		<b style="color:purple;">Required @subject: <xsl:value-of select="@subject"/></b><br/>
	   		<b style="color:purple;">Required @type: <xsl:value-of select="@type"/></b><br/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>



	<xsl:template name="topicprerequisites">
		<div style="border: thin gray solid;background:#eee;">
			<b style="font-size:larger;">meta: Parts</b><br/>
			<b>Prerequisites:</b><br/>
			<ul>
			<xsl:apply-templates/>
			</ul>
   		</div>
	</xsl:template>
	
	<xsl:template match="om:prerequisite">
		<li>
   		<b style="color:purple;">Required @id: <xsl:value-of select="@id"/></b><br/>
   		<b style="color:purple;">Required @local: <xsl:value-of select="@locale"/></b><br/>
   		<b style="color:purple;">Required @path: <xsl:value-of select="@path"/></b><br/>
		</li>
	</xsl:template>

<!--
      <procedure id="10525" subject="iPhone 5 Teardown" type="teardown">
         <title>iPhone 5 Teardown</title>
         <url>http://www.ifixit.com/Teardown/iPhone+5+Teardown/10525/1</url>
         <thumbnail>http://www.ifixit.com/igi/1nDsDmwjsuxhZSJH.thumbnail</thumbnail>
         <image_url>http://www.ifixit.com/igi/1nDsDmwjsuxhZSJH</image_url>
         <path>iPhone-5-Teardown-10525/procedure.xml</path>
      </procedure>
-->
	<xsl:template name="topicprocedures">
		<b>Procedures:</b><br/>
		<xsl:call-template name="checkHTMLatts"/>
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<xsl:template match="om:procedures/om:procedure">
		<li>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
		<xsl:template match="om:procedures/om:procedure/om:title">
			<b>Title: <xsl:apply-templates/></b><br/>
		</xsl:template>
		<xsl:template match="om:procedures/om:procedure/om:url">
			<xsl:variable name="thishref"><xsl:value-of select="."/></xsl:variable>
			<b>URL: </b><a href="{$thishref}"><xsl:apply-templates/></a><br/>
		</xsl:template>
		<xsl:template match="om:procedures/om:procedure/om:thumbnail">
			<xsl:variable name="thishref"><xsl:value-of select="."/></xsl:variable>
			<b>Thumbnail: </b><a href="{$thishref}"><xsl:apply-templates/></a><br/>
		</xsl:template>
		<xsl:template match="om:procedures/om:procedure/om:image_url">
			<xsl:variable name="thishref"><xsl:value-of select="."/></xsl:variable>
			<b>Image URL: </b><a href="{$thishref}"><xsl:apply-templates/></a><br/>
		</xsl:template>
		<xsl:template match="om:procedures/om:procedure/om:path">
			<xsl:variable name="thishref"><xsl:value-of select="."/></xsl:variable>
			<b>Path: </b><a href="?fileName={$thishref}"><xsl:apply-templates/></a><br/>
		</xsl:template>


	<xsl:template name="topiccontents" >
		<div style="border: thin white solid;background:#fff;margin: 10px 0 10px 0;">
			<b style="font-size:larger;">Content</b><br/>
   			<b style="color:purple;">Best practice: "content" is not required, but is an opportunity to provide additional unstructured information about the category.</b><br/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template name="topicmedia">
		<b>Media (A container for the introduction's media.):</b><br/>
   		<b style="color:purple;">Required @type: <xsl:value-of select="@type"/> must be image, video, or embed</b><br/>
		<div>
			<xsl:call-template name="checkHTMLatts"/>
			<b>Up to 3 images:</b><br/>
			<xsl:for-each select="om:image">
				<xsl:text>-----</xsl:text><br />
				<xsl:for-each select="@*[not(. = '')]">
					<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
				</xsl:for-each>
			</xsl:for-each>
			<b>OR a one video:</b><br/>
			<xsl:for-each select="om:video">
				<xsl:for-each select="om:encoding">
   					<b style="color:purple;">Required @url: <xsl:value-of select="@url"/></b><br/>
   					<b style="color:purple;">Required @width: <xsl:value-of select="@width"/></b><br/>
   					<b style="color:purple;">Required @height: <xsl:value-of select="@height"/></b><br/>
   					<b style="color:purple;">Required @codecs: <xsl:value-of select="@codecs"/></b><br/>
   					<b style="color:purple;">Required @format: <xsl:value-of select="@format"/></b><br/>
   					<b style="color:purple;">Required @mime: <xsl:value-of select="@mine"/></b><br/>
				</xsl:for-each>
				<xsl:for-each select="om:poster">
					<xsl:for-each select="@*[not(. = '')]">
						<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="om:source">
					<xsl:for-each select="@*[not(. = '')]">
						<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
			<b>OR a one embed:</b><br/>
			<xsl:for-each select="om:embed">
				<xsl:for-each select="om:encoding">
   					<b style="color:purple;">Required @type: <xsl:value-of select="@type"/></b><br/>
   					<b style="color:purple;">Required @version: <xsl:value-of select="@version"/></b><br/>
					<xsl:for-each select="@*[not(. = '')]">
						<xsl:value-of select="name()"/>="<xsl:value-of select="."/>"<br/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</div>
	</xsl:template>




	<!-- allowed "simplifiedHTML" content (better than just ANY)
		From github version .04 schema -->

	<xsl:template name="checkHTMLatts">
		<xsl:if test="@id !=''"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
		<xsl:if test="@class !=''"><xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute></xsl:if>
		<xsl:if test="@href !=''"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute></xsl:if>
		<xsl:if test="@style !=''"><xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute></xsl:if>
		<xsl:if test="@rel !=''"><xsl:attribute name="rel"><xsl:value-of select="@rel"/></xsl:attribute></xsl:if>
		<xsl:if test="@title !=''"><xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute></xsl:if>
		<xsl:if test="@target !=''"><xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute></xsl:if>
	</xsl:template>

	<xsl:template match="om:p">
		<p>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="om:a">
		<a>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xsl:template match="om:strong">
		<strong>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>

	<xsl:template match="om:em">
		<em>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</em>
	</xsl:template>

	<xsl:template match="om:h1">
		<h1>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>

	<xsl:template match="om:h2">
		<h2>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h2>
	</xsl:template>

	<xsl:template match="om:h3">
		<h3>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h3>
	</xsl:template>

	<xsl:template match="om:h4">
		<h4>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h4>
	</xsl:template>

	<xsl:template match="om:h5">
		<h5>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h5>
	</xsl:template>

	<xsl:template match="om:h6">
		<h6>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</h6>
	</xsl:template>

	<xsl:template match="om:tt">
		<tt>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</tt>
	</xsl:template>

	<xsl:template match="om:pre">
		<pre>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</pre>
	</xsl:template>

	<xsl:template match="om:code">
		<code>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</code>
	</xsl:template>

	<xsl:template match="om:ul">
		<ul>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="om:li">
		<li>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</li>
	</xsl:template>

	<xsl:template match="om:br">
		<br /><!-- as defined in the schema, this element can take all the atts of other HTML elements.-->
	</xsl:template>

	<xsl:template match="om:sup">
		<sup>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</sup>
	</xsl:template>

	<xsl:template match="om:sub">
		<sub>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>

	<xsl:template match="om:del">
		<del>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</del>
	</xsl:template>

	<xsl:template match="om:ins">
		<ins>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</ins>
	</xsl:template>

	<xsl:template match="om:div">
		<div>
			<xsl:call-template name="checkHTMLatts"/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>



<xsl:template match="*">
	<div style="border: thin green solid;padding: 3px;">
		<span style="color:orange;"><span style="color:black;">[<xsl:value-of select="name()"/>]</span>
		  <xsl:apply-templates />
		</span>
	</div>
</xsl:template>

<xsl:template name="unused1">
<div class="banner-content"  style="border: thin red solid;background:#fff;display:table-row;"> 
	<div class="banner-bucket" style="display:table-cell;"> 
		<div class="banner-small-photo"> 
			<xsl:apply-templates select="om:image" />
			<!--img src="http://d3nevzfk7ii3be.cloudfront.net/igi/llDdaUW3gxbquAiH.standard" alt="iPhone 5 Repair"/--> 
			<span class="banner-repairability-score repairability-score-7"> Repairability: <strong>7</strong> / 10</span> 
		</div> 
	</div> 
	<div class="banner-bucket banner-summary" style="display:table-cell;"> 
		<div class="banner-text"> 
			<h1 class="banner-title"><xsl:apply-templates select="om:title" /></h1> 
			<p class="banner-blurb"> <span class="topicHeaderText"><xsl:apply-templates select="om:description" /></span> </p> 
		</div> 
		<div class="action-buttons"> 
			<a href="/Guide/new/Device/iPhone+5" id="createGuide" class="button"><i class="icon-plus"></i> Create a Guide</a> 
		</div> 
	</div> 
	<div class="clearer"></div> 
</div>
</xsl:template>


</xsl:transform>