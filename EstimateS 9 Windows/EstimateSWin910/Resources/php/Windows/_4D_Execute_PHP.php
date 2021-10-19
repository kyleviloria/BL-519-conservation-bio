<?php
/**
 * executePHP
 * 
 * Execute the script specified by the "PHP Execute" 4D command
 * Usage: 
 * 	$boolOK:=PHP Execute(_4D_ScriptPath, [_4D_ScriptPath, _4D_FunctionName [, _4D_FastCGI_result [, _4D_FastCGI_param_{n} ]]])
 * Example:
 * <code>
 * // Note that this is 4D language code
 *  $boolOK:=PHP Execute(/Volumes/Disk/Folder/ExifThings.php", "GetExifInfos", $result, $imagePath)
 * </code>
 * 
 * A "php.ini" file SHOULD set 'display_errors' to 'stderr' for better error handling by 4D
 * It might set others error config as defined by this documentation :
 * @see http://www.php.net/manual/en/errorfunc.configuration.php
 * 
 * @since 4D v12
 * @version $Id$
 * @category PHP
 * @copyright Copyright (c) 2010 4D SAS (http://www.4d.com)
 * 
 * */
try {
	if (!isset($_ENV['_4D_ScriptPath']))
	{
		throw new Exception('Script not defined');
	}
	// Get 4D session
	if (isset($_ENV['_4D_Process']))
	{
		session_id($_ENV['_4D_Process']);
		session_start();
	}
	// send output data to a buffer
	ob_start();
	if ($_ENV['_4D_ScriptPath'] != 'php_command')
	{
	//	$path = utf8_decode($_ENV['_4D_ScriptPath'])
		$path = $_ENV['_4D_ScriptPath'];
		if (!file_exists($path))
		{
			throw new Exception('Script not found');
		}
		// execute php script
		// First, update the include_path, so a script using relative path will still execute properly
		set_include_path( get_include_path() . PATH_SEPARATOR . dirname($path) );
		require $path;
	}
	unset($_ENV['_4D_ScriptPath']);
	unset($path);

	// if a function name is specified call it with its potentials parameters
	if (isset($_ENV['_4D_FunctionName']) && $_ENV['_4D_FunctionName'] !== '')
	{
		if (!function_exists($_ENV['_4D_FunctionName']))
		{
				throw new Exception('Function not found');
		}
		$_4D_FunctionName = utf8_decode($_ENV['_4D_FunctionName']);
		unset($_ENV['_4D_FunctionName']);
		// get the parameters
		// Values are passed by 4D UTF-8 encoded (this is what json_decode() expects)
		$_4D_FastCGI_params = json_decode($_ENV['_4D_FunctionParams']);
		
		if(($_4D_FastCGI_params == '') && ($_ENV['_4D_FunctionParams'] !== ''))
		{
			throw new Exception('Bad JSON encoding for params');
		}
		
		// call the function and get the result
		if(count($_4D_FastCGI_params) > 0)
		{
			$_4D_FastCGI_result = call_user_func_array($_4D_FunctionName, $_4D_FastCGI_params);
		}
		else
		{
			$_4D_FastCGI_result = call_user_func($_4D_FunctionName);
		}
		// send the result to 4D
		if (is_scalar($_4D_FastCGI_result))
			$_4D_Encoded_result = $_4D_FastCGI_result;
		else
			$_4D_Encoded_result = json_encode( $_4D_FastCGI_result);
		header("X-4D-FunctionResult: " . strtr( base64_encode($_4D_Encoded_result), "\n\r", '  '));
	}
}
catch (Exception $_4D_FastCGI_error)
{
	/**
	 * All catched exception are sent to 4D with all details 
	 **/
	header('X-4DPHP-Error-Message: ' . utf8_encode($_4D_FastCGI_error->getMessage()));
	header('X-4DPHP-Error-Code: ' . $_4D_FastCGI_error->getCode());
	header('X-4DPHP-Error-File: ' . utf8_encode($_4D_FastCGI_error->getFile()));
	header('X-4DPHP-Error-Line: ' . $_4D_FastCGI_error->getLine());
	header('X-4DPHP-Error-Trace: ' . json_encode($_4D_FastCGI_error->getTraceAsString()));
	if (method_exists($_4D_FastCGI_error, 'getSeverity'))
	{
		// severity require a try because this method only exists for error exceptions
		header('X-4DPHP-Error-Severity: ' . $_4D_FastCGI_error->getSeverity());
	}
}
	ob_end_flush();
// Explicitely exit() because php.ini has a auto_prepend_file setting of this particular script
exit(0);

