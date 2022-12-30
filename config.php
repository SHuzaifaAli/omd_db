<?php

$host = "localhost";
$username = "root";
$password = "";
$db_name = "omd_db";
$connection = mysqli_connect($host, $username, $password, $db_name);

if (!$connection) {
    # code...
    echo "Connection Failed";
}