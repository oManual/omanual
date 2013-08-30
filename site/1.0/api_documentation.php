<?
   require "helpers.php";

   $endpoints = getEndpoints();
   $guide_endpoints = $endpoints['Guides']['public'];
   $category_endpoints = $endpoints['Content Hierarchy']['public'];

   $endpoints = array_merge($guide_endpoints, $category_endpoints);
?>

<p>
The API specification is designed to provide a simple way to
expose your oManual resources to other services or devices through simple REST API
endpoints.  API endpoints should be relative to a base server address (eg. <a href="http://www.ifixit.com/api/">http://www.ifixit.com/api</a>).
</p>

<div class="endpoints">
<? foreach ($endpoints as $endpoint): ?>
   <div class="endpoint req">
      <h4><span class="method"><?= $endpoint['method'] ?></span><?= $endpoint['endpoint'] ?></h4>
      <p><?= $endpoint['detailed_description'] ?></p>

      <h5>Query Parameters</h5>
      <dl>
      <? foreach ($endpoint['query_parameters'] as $name => $param):
            $required = $param['required'] ? "Required" : "Optional";
            $type = '<em>' . $param['type'] . '</em>';

            $description =  $param['description'];
            $descriptionList = idx($param, 'description_list', []);
            $example = idx($param, 'example', ''); ?>

         <? if ($name != 'unpatrolled' && $name != 'requireGuides'): ?>
         <dt><span class="name"><?= $name ?></span> &mdash; <?= $required ?> &mdash; <?= $type ?></dt>
         <dd class="description">
            <p><?= $description ?></p>
            <? if (count($descriptionList) != 0): ?>
               <ul>
               <? foreach($descriptionList as $key => $val): ?>
                  <li><strong><?= $key ?></strong>&mdash; <?= $val ?></li>
               <? endforeach ?>
               </ul>
            <? endif ?>
         </dd>
         <? endif ?>
      <? endforeach ?>
      </dl>
      <h5>Example Response</h5>
      <div class="endpointResponse">
         <pre><code><?= pygmentize(file_get_contents("api/" . $endpoint['response'][0]['file']), ['language' => 'json', 'linenos' => false]) ?></code></pre>
      </div>
   </div>
<? endforeach ?>
</div>
