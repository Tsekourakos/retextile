<?php //login_db.php
    // $hn = 'localhost';
    // $db = 'bitofhome';
    // $un = 'root';
    // $pw = ''

    $user = 'root';
    $pwd = '';

    $dbConnection = new PDO('mysql:dbname=bitofhome;host=localhost;charset=utf8', $user, $pwd);

    $dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 ?>
