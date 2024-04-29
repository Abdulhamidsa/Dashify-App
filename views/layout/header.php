<?php

require_once __DIR__ . "/../../database/_.php";


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Poppins&display=swap" rel="stylesheet">
    <?php
    if (isset($specificPageClass) && $specificPageClass === 'signup-user') {
        echo '<link rel="stylesheet" href="../../styles/signup.css">';
    }
    ?>
    <?php
    if (isset($specificPageClass) && $specificPageClass === 'index-user') {
        echo '<link rel="stylesheet" href="../../styles/user-index.css">';
    }
    ?>
    <?php
    if (isset($specificPageClass) && $specificPageClass === 'partner') {
        echo '<link rel="stylesheet" href="../../styles/partner.css">';
    }
    ?>
    <link rel="stylesheet" href="../../styles/global.css">

    <title><?php echo isset($page) ? $page . ' - Dashify' : 'Dashify'; ?></title>
</head>

<body>