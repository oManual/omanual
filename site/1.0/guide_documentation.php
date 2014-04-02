
<p>
  A guide is a structured collection of steps. Each must include text and 
media. For consistency of display, we recommend each step consist of 1-3 
images or one rich media object, as well as no more than eight lines of text.
</p>

<div class="legend">
   <div class="req"><span class="box"></span> required</div>
   <div class="opt"><span class="box"></span> optional</div>
</div>

<div class="tagListing" id="guide">
      <div class="tag req">
         <h4><a href="#guide">guide</a></h4>
         <p class="desc">
         The root of an oManual guide.
         </p>
         <div>
            <ul class="attr">
               <li class="attr-intro">Attributes:</li>
               <li><strong class="req">locale</strong> <em>required</em> The language the guide is written in.</li>
            </ul>
         </div>
      </div>

      <div class="subtag" id="title">

         <div class="tag req">
            <h4><a href="#title">modified_date</a></h4>
            <p class="desc">
               ISO 8601 date in the format YYYY-MM-DDThh:mm:ssTZD - Date and time this guide was last updated. This element can be useful for checking if there are updates to the guide.  The modified_date is the same as the created_on date in a new guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="tag req">
            <h4><a href="#title">created_date</a></h4>
            <p class="desc">
               ISO 8601 date in the format YYYY-MM-DDThh:mm:ssTZD - Date and time when this guide was first created.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="tag req">
            <h4><a href="#title">title</a></h4>
            <p class="desc">
            Contains the title of the guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes:</li>
                  <li><strong>subject</strong> <em>optional</em> The subject of the guide. ex: Bottom Bezel Bracket</li>
                  <li><strong>type</strong> <em>optional</em> What the guide explains in relation to the subject. ex: Installation</li>
               </ul>
            </div>
         </div>

         <div class="tag" id="summary">
            <h4><a href="#summary">summary</a></h4>
            <p class="desc">
            A text field that contains less than or equal to 255 characters describing the guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="tag req" id="image-1">
            <h4><a href="#image-1">image</a></h4>
            <p class="desc">
            The path to the image introducing the guide. Image is required, so if you do not have an additional primary image, duplicate the first image of the guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes:</li>
                  <li><strong>mini</strong> <em>optional</em> path to a thumbnail of the image no larger than 56x42.</li>
                  <li><strong>thumbnail</strong> <em>optional</em> path to a thumbnail of the image no larger than 96x72.</li>
                  <li><strong>standard</strong> <em>optional</em> path to a thumbnail of the image no larger than 300x225.</li>
                  <li><strong>medium</strong> <em>optional</em> path to a thumbnail of the image no larger than 592x444.</li>
                  <li><strong>large</strong> <em>optional</em> path to a thumbnail of the image no larger than 800x600.</li>
               </ul>
            </div>
         </div>

         <div class="tag req">
            <h4><a href="#author">author</a></h4>
            <p class="desc">
               Author of the guide.  In the case of multiple authors, this would be the primary author or maintainer of the guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes:</li>
                  <li><strong>id</strong> <em>optional</em> An id uniquely identifying the user, to be used to tie authors together across documents. (Can be a string or an integer.)</li>
               </ul>
            </div>
         </div>

         <div class="tag" id="time-required">
            <h4><a href="#time-required">time_required</a></h4>
            <p class="desc">
            A human readable description of how long the guide takes. ex: 15 minutes
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="tag" id="difficulty">
            <h4><a href="#difficulty">difficulty</a></h4>
            <p class="desc">
            A determination of the difficulty of the guide for your target audience. Please choose from one of these five options:
            </p>
            <ul>
               <li>Very easy</li>
               <li>Easy</li>
               <li>Moderate</li>
               <li>Difficult</li>
               <li>Very difficult</li>
            </ul>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="tag" id="category">
            <h4><a href="#category">category</a></h4>
            <p class="desc">
            The name of the category that this guide belongs to.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>


         <div class="tag req" id="introduction">
            <h4><a href="#introduction">introduction</a></h4>
            <p class="desc">
            <a href="#simpleHTML">Simplified HTML</a> formatted text introducing the guide. This could describe anything from how to set up for the guide to an introduction of the guides subject matter. There is no length limit, but we suggest limiting this to no more than 2-3 paragraphs.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="media-1">
               <div class="tag" id="media-2">
                  <h4><a href="#media-2">media</a></h4>
                  <p class="desc">
                  A container for the introduction's media. It can contain one of these: 1-3 images OR a video OR a remote <a href="http://oembed.com/#section2" target="_blank">oEmbed object</a>.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes:</li>
                        <li><strong>type</strong> <em>required</em> The type of media. Valid values: image, video, embed.</li>
                     </ul>
                  </div>
               </div>

               <div class="subtag" id="image-2">
                  <div class="tag">
                     <h4><a href="#image-2">image</a></h4>
                     <p class="desc">
                     Image to include with the introduction.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>orderby</strong> <em>optional</em> The image order.</li>
                           <li><strong>mini</strong> <em>optional</em> Path to a thumbnail of the image no larger than 56x42.</li>
                           <li><strong>thumbnail</strong> <em>optional</em> Path to a thumbnail of the image no larger than 96x72.</li>
                           <li><strong>standard</strong> <em>optional</em> Path to a thumbnail of the image no larger than 300x225.</li>
                           <li><strong>medium</strong> <em>optional</em> Path to a thumbnail of the image no larger than 592x444.</li>
                           <li><strong>large</strong> <em>optional</em> Path to a thumbnail of the image no larger than 800x600.</li>
                        </ul>
                     </div>
                  </div>

               <div class="tag" id="video">
                  <h4><a href="#video">video</a></h4>
                  <p class="desc">
                  Video to include in the introduction.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes: none</li>
                     </ul>
                  </div>
               </div>

               <div class="subtag" id="video-1">
                  <div class="tag" id="encoding">
                     <h4><a href="#encoding">encoding</a></h4>
                     <p class="desc">
                     Describes the different possible encodings for the video.  Different web browsers, mobile devices and operating systems require different formats to play videos.  Because of this, there can be 1 to N number of encodings.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>url</strong> <em>required</em> Relative location of the video, or a URL if the video is not stored locally</li>
                           <li><strong>width</strong> <em>required</em> Video width.</li>
                           <li><strong>height</strong> <em>required</em> Video height.</li>
                           <li><strong>codecs</strong> <em>required</em> Compression standard used by the video.</li>
                           <li><strong>format</strong> <em>required</em> Type of file container that holds one or more codecs.  For example - MOV, OGG, AVI, MP4.</li>
                           <li><strong>mime</strong> <em>required</em> Internet media type, usually video/{format}.  For example - video/ogg, video/mp4, video/webm</li>
                        </ul>
                     </div>
                  </div>

                  <div class="tag" id="poster">
                     <h4><a href="#poster">poster</a></h4>
                     <p class="desc">
                     Default image for the video.  Usually a descriptive image that's shown to display the video, before the video is loaded or played.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>guid</strong> <em>optional</em> Unique identifier for the video thumbnail</li>
                           <li><strong>ratio</strong> <em>optional</em> Aspect ratio of the thumbnail image.  Possible values: ONE_ONE, FOUR_THREE, VARIABLE</li>
                           <li><strong>mini</strong> <em>optional</em> Path to the image no larger than 56x42.</li>
                           <li><strong>thumbnail</strong> <em>optional</em> Path to the image no larger than 96x72.</li>
                           <li><strong>standard</strong> <em>optional</em> Path to the image no larger than 300x225.</li>
                           <li><strong>medium</strong> <em>optional</em> Path to the image no larger than 592x444.</li>
                           <li><strong>large</strong> <em>optional</em> Path to the image no larger than 800x600.</li>
                        </ul>
                     </div>
                  </div>

                  <div class="tag" id="source">
                     <h4><a href="#source">source</a></h4>
                     <p class="desc">
                     Detailed information about the original video source.
                     This is useful if you have encoded a video from a different codec and format 
                     and would like to store information about the original video or access 
                     additional information, such as frame_rate or audio_codec which would stay the 
                     same between different encodings.  This element is flexible, meaning it can 
                     include any attributes in addition to the ones described below.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>duration_in_ms</strong> <em>optional</em> </li>
                           <li><strong>audio_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>audio_sample_rate</strong> <em>optional</em> </li>
                           <li><strong>video_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>total_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>audio_sample_rate</strong> <em>optional</em> </li>
                           <li><strong>video_codec</strong> <em>optional</em> </li>
                           <li><strong>audio_codec</strong> <em>optional</em> </li>
                           <li><strong>frame_rate</strong> <em>optional</em> </li>
                           <li><strong>format</strong> <em>optional</em> </li>
                           <li><strong>channels</strong> <em>optional</em> </li>
                           <li><strong>file_size_in_bytes</strong> <em>optional</em> </li>
                           <li><strong>width</strong> <em>optional</em> </li>
                           <li><strong>height</strong> <em>optional</em> </li>
                           <li>...</li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="tag" id="embed">
                  <h4><a href="#embed">embed</a></h4>
                  <p class="desc">
                  Remote embed to include with the introduction.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes:</li>
                        <li><strong class="req">type</strong> <em>required</em> The resource type. Valid values are [photo, video, link, rich].  Visit the section on these types in the <a href="http://oembed.com/#section2" target="_blank">oEmbed spec</a> to learn more.</li>
                        <li><strong class="req">version</strong> <em>required</em> The <a href="http://oembed.com/#section2" target="_blank">oEmbed</a> version number. This must be <code>1.0</code>.</li>
                        <li><strong>html</strong> <em>optional</em> The body of the embed object, could be an iframe embedded content or a block of html depending on the type.</li>
                        <li><strong>height</strong> <em>optional</em> The height of the embedded object.</li>
                        <li><strong>width</strong> <em>optional</em> The width of the embedded object.</li>
                        <li><strong>title</strong> <em>optional</em> A text title, describing the resource.</li>
                        <li><strong>author_name</strong> <em>optional</em> The name of the author/owner of the resource.</li>
                        <li><strong>author_url</strong> <em>optional</em> A URL for the author/owner of the resource.</li>
                        <li><strong>provider_name</strong> <em>optional</em> The name of the resource provider.</li>
                        <li><strong>provider_url</strong> <em>optional</em> The url of the resource provider.</li>
                        <li><strong>cache_age</strong> <em>optional</em> The <i>suggested</i> cache lifetime for this resource, in seconds. Consumers may choose to use this value or not.</li>
                        <li><strong>thumbnail_url</strong> <em>optional</em> A URL to a thumbnail image representing the resource. The thumbnail must respect any <code>maxwidth</code> and <code>maxheight</code> parameters. If this parameter is present, <code>thumbnail_width</code> and <code>thumbnail_height</code> must also be present.</li>
                        <li><strong>thumbnail_width</strong> <em>optional</em> The width of the optional thumbnail. If this parameter is present, <code>thumbnail_url</code> and <code>thumbnail_height</code> must also be present.</li>
                        <li><strong>thumbnail_height</strong> <em>optional</em> The height of the optional thumbnail. If this parameter is present, <code>thumbnail_url</code> and <code>thumbnail_width</code> must also be present.</li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>

         <div class="tag req" id="tools">
            <h4><a href="#tools">tools</a></h4>
            <p class="desc"></p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="tool">
            <div class="tag">
               <h4><a href="#tool">tool</a></h4>
               <p class="desc">
               A required or suggested tool or implement. Use a name common to all of your guides and specify variations using the type attribute.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong>name</strong> <em>required</em> Tool name.</li>
                     <li><strong>type</strong> <em>optional</em> The type of tool. Specifying type can be a useful way of consolidating tool names, for example an 8mm socket could be specified as name: socket, type: 8mm.</li>
                     <li><strong>quantity</strong> <em>optional</em> Integer quantity of tool required. If omitted, this is assumed to be 1.</li>
                     <li><strong>notes</strong> <em>optional</em> Information specific to using this tool for this guide.</li>
                     <li><strong>thumbnail</strong> <em>optional</em> Path to an image to go along with the tool.</li>
                     <li><strong>url</strong> <em>optional</em> A URL for an external reference describing the tool.</li>
                     <li><strong>sku</strong> <em>optional</em> The manufacturer SKU / part number.</li>
                  </ul>
               </div>
            </div>
            <div class="subtag" id="external-sources">
               <div class="tag">
                  <h4><a href="#external-sources">external_sources</a></h4>
                  <p class="desc">
                  A list of all the sources for aquiring this tool.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes: None</li>
                     </ul>
                  </div>
               </div>
               <div class="subtag" id="external-source">
                  <div class="tag">
                     <h4><a href="#external-sources">external_source</a></h4>
                     <p class="desc">
                         External source used for sourcing and aquiring this tool.  Could be an e-commerce site, brick and mortar store, guide or full oManual.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>id</strong> <em>optional</em> String identifier for the tool at the external source.  If the external source is a guide, the id would be the guide name.</li>
                           <li><strong>url</strong> <em>optional</em> Path to an external site that sells or distributes this tool.  Alternatively, it could be a relative path to a different guide that produces this tool.</li>
                           <li><strong>notes</strong> <em>optional</em> Any important information about this source.  For example, if the source is notorious for slow shipping times or poor quality, this would be the place to note that.</li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="tag req" id="parts">
            <h4><a href="#parts">parts</a></h4>
            <p class="desc"></p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="part">
            <div class="tag">
               <h4><a href="#part">part</a></h4>
               <p class="desc">
               A part, material, or ingredient used in the guide. Use a name common to all of your guides and specify variations using the type attribute.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong class="req">name</strong> <em>required</em> Part name</li>
                     <li><strong>sku</strong> <em>optional</em> A global string identifier for the part.</li>
                     <li><strong>type</strong> <em>optional</em> The type of part. Specifying type can be a useful way of consolidating names, for example a 5Ω resistor could be specified as name: resistor, type: 5Ω.</li>
                     <li><strong class="req">quantity</strong> <em>required</em> How many of this part are required.</li>
                     <li><strong>thumbnail</strong> <em>optional</em> URI of an image to go along with the part.</li>
                     <li><strong>url</strong> <em>optional</em> A URL for a page describing the part.</li>
                     <li><strong>notes</strong> <em>optional</em> Information specific to using this part for this guide.</li>
                  </ul>
               </div>
            </div>
            <div class="subtag" id="external-sources">
               <div class="tag">
                  <h4><a href="#external-sources">external_sources</a></h4>
                  <p class="desc">
                  A list of all the sources for aquiring this part.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes: None</li>
                     </ul>
                  </div>
               </div>
               <div class="subtag" id="external-source">
                  <div class="tag">
                     <h4><a href="#external-sources">external_source</a></h4>
                     <p class="desc">
                         External source used for sourcing and aquiring this part.  Could be an e-commerce site, brick and mortar store, guide or full oManual.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>id</strong> <em>optional</em> String identifier for the part at the external source.  If the external source is a guide, the id would be the guide name.</li>
                           <li><strong>url</strong> <em>optional</em> Path to an external site that sells or distributes this part.  Alternatively, it could be a relative path to a different guide that produces this part.</li>
                           <li><strong>notes</strong> <em>optional</em> Any important information about this source.  For example, if the source is notorious for slow shipping times or poor quality, this would be the place to note that.</li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="tag req" id="flags">
            <h4><a href="#flags">flags</a></h4>
            <p class="desc"> </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="flag">
            <div class="tag">
               <a href="#flag"><h4>flag</h4> </a>
               <p class="desc">
               A flag or informational note about the guide. The text field contains a full text notice of what this flag means to the user.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong>id</strong> <em>optional</em> A unique string identifier for the flag.</li>
                     <li><strong class="req">title</strong> <em>required</em> A short title for the flag. ex: In Progress</li>
                     <li><strong>image</strong> <em>optional</em> URI of an image to go along with the flag, no larger than 44x44.</li>
                  </ul>
               </div>
            </div>
         </div>

         <div class="tag req" id="documents">
            <h4><a href="#documents">documents</a></h4>
            <p class="desc"></p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="document">
            <div class="tag">
               <h4><a href="#document">document</a></h4>
               <p class="desc">
               A document attached to the guide. The text for this element should be the filename of the attached document.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong class="req">url</strong> <em>required</em> Path to the document.</li>
                  </ul>
               </div>
            </div>
         </div>

         <div class="tag req" id="prerequisites">
            <h4><a href="#prerequisites">prerequisites</a></h4>
            <p class="desc">
               A collection of guides that must be completed prior to starting this guide.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="prerequisite">
            <div class="tag">
               <h4><a href="#prerequisite">prerequisite</a></h4>
               <p class="desc">
                  The title of a prerequisite guide. Prerequisite guides should be written such that steps can be <em>inlined</em> directly into this guide. You can see an example of this with the <a href="http://www.ifixit.com/Guide/Installing-MacBook-Core-2-Duo-RAM/512/1">prerequisite implementation on iFixit</a>.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong class="req">id</strong> <em>required</em> An id for the associated prerequisite guide.</li>
                     <li><strong class="req">locale</strong> <em>required</em> The language the guide is written in.</li>
                     <li><strong class="req">path</strong> <em>required</em> The path to the prerequisite guide.</li>
                  </ul>
               </div>
            </div>
         </div>

         <div class="tag req" id="steps">
            <h4><a href="#steps">steps</a></h4>
            <p class="desc">
              Collection of step-by-step instructions.
            </p>
            <div>
               <ul class="attr">
                  <li class="attr-intro">Attributes: None</li>
               </ul>
            </div>
         </div>

         <div class="subtag" id="step">
            <div class="tag">
               <h4><a href="#step">step</a></h4>
               <p class="desc">
               The step. Contains the line, object, and image elements.
               </p>
               <div>
                  <ul class="attr">
                     <li class="attr-intro">Attributes:</li>
                     <li><strong class="req">number</strong> <em>required</em> The step number starting from 1.</li>
                     <li><strong>title</strong> <em>optional</em> The title of the step.</li>
                  </ul>
               </div>
            </div>

            <div class="subtag" id="lines">
               <div class="tag req">
                  <h4><a href="#lines">lines</a></h4>
                  <p class="desc">
                  Lines of text belonging to this step. We recommend a step not have more than eight lines, and that each line not exceed 500 characters. It is best to think of each line as a discrete piece of information or instruction.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes: None</li>
                     </ul>
                  </div>
               </div>

               <div class="subtag" id="line">
                  <div class="tag">
                     <h4><a href="#line">line</a></h4>
                     <p class="desc">
                     A bullet line of text in the step or paragraph of instructions. Recommended not to exceed 500 characters.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>bullet</strong> <em>optional</em> Which color or type of bullet to use. If you specify icon_note, icon_reminder, or icon_caution, the bullet color should default to black. Valid values are:</li>
                           <li>
                              <ul>
                                 <li>black</li>
                                 <li>red</li>
                                 <li>orange</li>
                                 <li>yellow</li>
                                 <li>green</li>
                                 <li>blue</li>
                                 <li>violet</li>
                                 <li>icon_note</li>
                                 <li>icon_reminder</li>
                                 <li>icon_caution</li>
                              </ul>
                           </li>
                           <li><strong>level</strong> <em>optional</em> How indented this line is. We recommend that the indentation level is no larger than 3.</li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="tag req" id="media">
                  <h4><a href="#media">media</a></h4>
                  <p class="desc">
                  A container for the step media. Each step can have one of these: 1-3 images OR a video OR a remote <a href="http://oembed.com/#section2" target="_blank">oEmbed object</a>.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes:</li>
                        <li><strong>type</strong> <em>required</em> The type of media. Valid values: image, video, embed.</li>
                     </ul>
                  </div>
               </div>

               <div class="subtag" id="image-2">
                  <div class="tag">
                     <h4><a href="#image-2">image</a></h4>
                     <p class="desc">
                     Image to include with this step.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>orderby</strong> <em>optional</em> The image order relative to the others.  Starts at 1.</li>
                           <li><strong>mini</strong> <em>optional</em> Path to the image no larger than 56x42.</li>
                           <li><strong>thumbnail</strong> <em>optional</em> Path to the image no larger than 96x72.</li>
                           <li><strong>standard</strong> <em>optional</em> Path to the image no larger than 300x225.</li>
                           <li><strong>medium</strong> <em>optional</em> Path to the image no larger than 592x444.</li>
                           <li><strong>large</strong> <em>optional</em> Path to the image no larger than 800x600.</li>
                        </ul>
                     </div>
                  </div>

               <div class="tag" id="video">
                  <h4><a href="#video">video</a></h4>
                  <p class="desc">
                  Video to include with this step.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes: none</li>
                     </ul>
                  </div>
               </div>

               <div class="subtag" id="video-1">
                  <div class="tag" id="encoding">
                     <h4><a href="#encoding">encoding</a></h4>
                     <p class="desc">
                     Describes the different possible encodings for the video.  Different web browsers, mobile devices and operating systems require different formats to play videos.  Because of this, there can be 1 to N number of encodings.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>url</strong> <em>required</em> Relative location of the video, or a URL if the video is not stored locally.</li>
                           <li><strong>width</strong> <em>required</em> Video width.</li>
                           <li><strong>height</strong> <em>required</em> Video height.</li>
                           <li><strong>codecs</strong> <em>required</em> Compression standard used by the video.</li>
                           <li><strong>format</strong> <em>required</em> Type of file container that holds one or more codecs.  For example - MOV, OGG, AVI, MP4.</li>
                           <li><strong>mime</strong> <em>required</em> Internet media type, usually video/{format}.  For example - video/ogg, video/mp4, video/webm./</li>
                        </ul>
                     </div>
                  </div>

                  <div class="tag" id="poster">
                     <h4><a href="#poster">poster</a></h4>
                     <p class="desc">
                     Default image for the video.  Usually a descriptive image that's shown to display the video, before the video is loaded or played.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>guid</strong> <em>optional</em> Unique identifier for the video thumbnail</li>
                           <li><strong>ratio</strong> <em>optional</em> Aspect ratio of the thumbnail image.  Possible values: ONE_ONE, FOUR_THREE, VARIABLE</li>
                           <li><strong>mini</strong> <em>optional</em> Path to the image no larger than 56x42.</li>
                           <li><strong>thumbnail</strong> <em>optional</em> Path to the image no larger than 96x72.</li>
                           <li><strong>standard</strong> <em>optional</em> Path to the image no larger than 300x225.</li>
                           <li><strong>medium</strong> <em>optional</em> Path to the image no larger than 592x444.</li>
                           <li><strong>large</strong> <em>optional</em> Path to the image no larger than 800x600.</li>
                        </ul>
                     </div>
                  </div>

                  <div class="tag" id="source">
                     <h4><a href="#source">source</a></h4>
                     <p class="desc">
                     Detailed information about the original video source.  This is useful if you have encoded a video from a different codec and format and would like to store information about the original video or access additional information, such as frame_rate or audio_codec which would stay the same between different encodings.  This element is flexible, meaning it can include any attributes in addition to the ones described below.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong>duration_in_ms</strong> <em>optional</em> </li>
                           <li><strong>audio_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>audio_sample_rate</strong> <em>optional</em> </li>
                           <li><strong>video_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>total_bitrate_in_kbps</strong> <em>optional</em> </li>
                           <li><strong>audio_sample_rate</strong> <em>optional</em> </li>
                           <li><strong>video_codec</strong> <em>optional</em> </li>
                           <li><strong>audio_codec</strong> <em>optional</em> </li>
                           <li><strong>frame_rate</strong> <em>optional</em> </li>
                           <li><strong>format</strong> <em>optional</em> </li>
                           <li><strong>channels</strong> <em>optional</em> </li>
                           <li><strong>file_size_in_bytes</strong> <em>optional</em> </li>
                           <li><strong>width</strong> <em>optional</em> </li>
                           <li><strong>height</strong> <em>optional</em> </li>
                           <li>...</li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="tag" id="embed">
                  <h4><a href="#embed">embed</a></h4>
                  <p class="desc">
                  Remote embed to include with this step. Each embed can include the same fields specified by the <a href="http://oembed.com/#section2" target="_blank" title="Open oEmbed spec in seperate window">oEmbed spec</a>.
                  </p>
                  <div>
                     <ul class="attr">
                        <li class="attr-intro">Attributes:</li>
                        <li><strong class="req">type</strong> <em>required</em> The resource type. Valid values are [photo, video, link, rich].  Visit the section on these types in the <a href="http://oembed.com/#section2" target="_blank">oembed spec</a> to learn more.</li>
                        <li><strong class="req">version</strong> <em>required</em> The <a href="http://oembed.com/#section2" target="_blank">oEmbed</a> version number. This must be <code>1.0</code>.</li>
                        <li><strong>html</strong> <em>optional</em> The body of the embed object, could be an iframe embeded content or a block of html depending on the type.</li>
                        <li><strong>url</strong> <em>optional</em> URL to the source of the embedded media.</li>
                        <li><strong>height</strong> <em>optional</em> The height of the embedded object.</li>
                        <li><strong>width</strong> <em>optional</em> The width of the embedded object.</li>
                        <li><strong>title</strong> <em>optional</em> A text title, describing the resource.</li>
                        <li><strong>author_name</strong> <em>optional</em> The name of the author/owner of the resource.</li>
                        <li><strong>author_url</strong> <em>optional</em> A URL for the author/owner of the resource.</li>
                        <li><strong>provider_name</strong> <em>optional</em> The name of the resource provider.</li>
                        <li><strong>provider_url</strong> <em>optional</em> The url of the resource provider.</li>
                        <li><strong>cache_age</strong> <em>optional</em> The <i>suggested</i> cache lifetime for this resource, in seconds. Consumers may choose to use this value or not.</li>
                        <li><strong>thumbnail_url</strong> <em>optional</em> A URL to a thumbnail image representing the resource. The thumbnail must respect any <code>maxwidth</code> and <code>maxheight</code> parameters. If this parameter is present, <code>thumbnail_width</code> and <code>thumbnail_height</code> must also be present.</li>
                        <li><strong>thumbnail_width</strong> <em>optional</em> The width of the optional thumbnail. If this parameter is present, <code>thumbnail_url</code> and <code>thumbnail_height</code> must also be present.</li>
                        <li><strong>thumbnail_height</strong> <em>optional</em> The height of the optional thumbnail. If this parameter is present, <code>thumbnail_url</code> and <code>thumbnail_width</code> must also be present.</li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="tag" id="conclusion">
         <h4><a href="#conclusion">conclusion</a></h4>
         <p class="desc">
         Simple HTML-formatted text for the conclusion.
         </p>
         <div>
            <ul class="attr">
               <li class="attr-intro">Attributes: None</li>
            </ul>
         </div>
      </div>
   </div>
</div>

