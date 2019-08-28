<?php 
    include 'conn.php';

    $itemcode = $_POST['itemcode'];
    $itemname = $_POST['itemname'];
    $itemprice = $_POST['itemprice'];
    $itemstock = $_POST['itemstock'];
    $id = $_POST['id'];
    
    $connect->query("UPDATE barang SET kode_barang = '". $itemcode ."', nama_barang = '". $itemname ."', harga = '". $itemprice ."', stok = '". $itemstock ."' WHERE id=" . $id);
    