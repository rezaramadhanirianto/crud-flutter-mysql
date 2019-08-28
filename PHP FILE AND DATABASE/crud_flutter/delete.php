<?php 
    include 'conn.php';

    $id = $_POST['id'];
    $connect->query("DELETE FROM barang WHERE id=" . $id);