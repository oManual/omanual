<?
/**
 * Access an array index, retrieving the value stored there if it exists or
 * a default if it does not. This function allows you to concisely access an
 * index which may or may not exist without raising a warning.
 *
 * @param   array   Array to access.
 * @param   scalar  Index to access in the array.
 * @param   wild    Default value to return if the key is not present in the
 *                  array.
 * @return  wild    If $array[$key] exists, that value is returned. If not,
 *                  $default is returned without raising a warning.
 * @group   util
 */
function idx(array $array, $key, $default = null) {
  // isset() is a micro-optimization - it is fast but fails for null values.
  if (isset($array[$key])) {
    return $array[$key];
  }

  // Comparing $default is also a micro-optimization.
  if ($default === null || array_key_exists($key, $array)) {
    return null;
  }

  return $default;
}

/**
 * Uses the external command "pygmentize" to convert raw text to marked-up
 * (colored for syntax according to the language passed in) HTML.
 *
 * Example usage:
 *
 *    {pygmentize language="javascript"}
 *    someExampleCode.goes.here();
 *    {/pygmentize}
 *
 * @author stice
 * @package Smarty
 * @subpackage plugins
 */
function pygmentize($content, $params) {
   $output = "";
   if (is_null($content))
      return $output;

   if (empty($content) || !isset($params['language']))
      throw new Exception('pygmentize: Missing text or language.');

   $params = array_merge(array(
      'format' => 'html',
      'linenos' => 'table',
      'style' => null
   ), $params);

   // The 'true' parameter makes var_export return a string instead of
   // printing to stdout.
   $md5 = md5($content . var_export($params, true));
   $hash_key = "smarty_code_{$md5}";

   $cmd = array(
      '/usr/bin/pygmentize',
      '-f', $params['format'],
      '-l', $params['language'],
      '-O', 'classprefix=pyg_',
      '-O', "linenos={$params['linenos']}",
   );

   if (!is_null($params['style'])) {
      $cmd = array_merge($cmd, array(
         '-O', 'noclasses=True',
         '-O', "style={$params['style']}"
      ));
   }

   $cmd = implode(' ', $cmd);

   $ds = array(
      0 => array('pipe', 'r'),
      1 => array('pipe', 'w'),
      2 => array('file', '/tmp/pygmentize-errors.log', 'a')
   );

   $process = proc_open($cmd, $ds, $pipes);

   if (is_resource($process)) {
      fwrite($pipes[0], $content);
      fclose($pipes[0]);

      $output = stream_get_contents($pipes[1]);
      fclose($pipes[1]);

      proc_close($process);

   } else
     return 'not a process';

   return $output;
}

function getEndpoints() {
   $error = '';
   $jsonString = file_get_contents("api/endpoints.json");
   $json = json_decode($jsonString, true); 

   switch (json_last_error()) {
      case JSON_ERROR_NONE:
         // Fail right away so no error is set
         break;
      case JSON_ERROR_DEPTH:
         $error = 'Maximum stack depth exceeded';
         break;
      case JSON_ERROR_STATE_MISMATCH:
         $error = 'Underflow or the modes mismatch';
         break;
      case JSON_ERROR_CTRL_CHAR:
         $error = 'Unexpected control character found';
         break;
      case JSON_ERROR_SYNTAX:
         $error = 'Syntax error, malformed JSON';
         break;
      case JSON_ERROR_UTF8:
         $error = 'Malformed UTF-8 characters, possibly incorrectly encoded';
         break;
      default:
         $error = 'Unknown error';
         break;
   }
   return $json['endpoints'];
}
