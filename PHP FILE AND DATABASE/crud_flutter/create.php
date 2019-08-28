<?php 
    include 'conn.php';

    $itemcode = $_POST['itemcode'];
    $itemname = $_POST['itemname'];
    $itemprice = $_POST['itemprice'];
    $itemstock = $_POST['itemstock'];

    $connect->query("INSERT INTO barang VALUES('', '" . $itemcode . "', '" . $itemname . "', '" . $itemprice . "', '" . $itemstock . "')");

