<!--
Connecting to the database

If you want to connect to the DB, you must include the following php statment at the top from the other php files.
<?php
//include("dbconnect.php");
?>
-->


<?php

$servername = "scip.dev";
$username = "root";
$password = "Scip12345";

function connectDb($dbUser,$dbPass) {    
    $con = mysql_connect("localhost/pictr", $dbUser, $dbPass);
    // If it can't connect to the database: Error!
    if (!$con) {
        die('Could not connect: ' . mysql_error());
    } 
    return $con;
}


function disconnectdb($con) {
    mysql_close($con);
}


function checkUser($username, $pass) {
	$username = mysql_real_escape_string($username);
	$pass = mysql_real_escape_string($pass);
    //Make global variables availabe in the function
    global $dbUser, $dbPass, $dbName; 
    //Query
    $sql = "SELECT USERNAME, PASSWORD FROM tb_user WHERE USERNAME='".$username."'";
    //Connect
    $con = connectDb($dbUser, $dbPass);
    //SQL Select
    mysql_select_db($dbName, $con);
    //Send qurey at DB
    $result = mysql_query($sql, $con);
    //Evaluate line by line
    while ($row = mysql_fetch_row($result)) {        
        //Test
        if ($row[0] == $username) {            
            //If the User was found => check password (MD5 encoded)
            if ($row[1] == md5($pass)) {
                return true;
            }
        }
    }
    return false;
}


function insert_user($username, $password, $name, $forename){
	$username = mysql_real_escape_string($username);
	$password = mysql_real_escape_string($password);
	$name = mysql_real_escape_string($name);
	$forename = mysql_real_escape_string($forename);

	global $dbUser, $dbPass, $dbName;
	//SQL Statement
	$date = (string)date('d.m.Y');
	$sql = 'INSERT INTO tb_user(USERNAME, PASSWORD,NAME, FORENAME, COVER, PROFILEPICTURE, TIMESTAMP)';
	$sql = $sql . ' VALUES("'.$username.'","'.md5($password).'","'.$name.'","'.$forename.'","upload/standard_coverpic.jpg", "upload/standard_profilepic.jpg", "' . $date . '")';
	//DB Verbindung aufbauen
	 $con = connectDb($dbUser, $dbPass);
	 //SQL Select
    mysql_select_db($dbName, $con);
    $result = mysql_query($sql, $con);
	
}


function insert_query($sql){
global $dbUser, $dbPass, $dbName;
	//DB Verbindung aufbauen
	 $con = connectDb($dbUser, $dbPass);
	 //SQL Select
    mysql_select_db($dbName, $con);
    $result = mysql_query($sql, $con);
}

/*
Function SELECT Query individual Rows
*/

function select_query($sql){
	global $dbUser, $dbPass, $dbName;
	//DB Verbindung aufbauen
	 $con = connectDb($dbUser, $dbPass);
	//SQL Select
    mysql_select_db($dbName, $con);
    $result = mysql_query($sql, $con);
	$row =  mysql_fetch_row($result);
	
	return $row;
}

/*
Function SELECT Query for multiple Rows
*/
function select_all_query($sql){
	global $dbUser, $dbPass, $dbName;
	//DB Verbindung aufbauen
	 $con = connectDb($dbUser, $dbPass);
	//SQL Select
    mysql_select_db($dbName, $con);
    $result = mysql_query($sql, $con);
	
	return $result;
}
?>

