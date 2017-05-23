<?php
require dirname(__file__)."/config.php";
$dsn = DBMS.":host=".DB_HOST.";dbname=".DB_NAME;
try{
    $pdo = new PDO($dsn,DB_USER,DB_PASS);
    // echo "OK";
    // foreach ($pdo->query("SELECT * FROM flag") as $row) {
    //     print_r($row);
    //     echo $row["team1"];
    // }
    // $pdo = null;
}catch(PDOException $e){
    die("[!] Error: ".$e->getMessage()."<br/>");
}