<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        #action{
            font-size:6px;
            font-family: monospace;

        }
    </style>
</head>
<body>

<form action="index.php" method="post" enctype="multipart/form-data">
    Color:
    <input type="checkbox" name="color" title="color" value="Yes"/>
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload Image" name="submit">

</form>

<div id="action">
<?php
//if(isset($argv[1]) && strlen($argv[1])) {
//    $file = $argv[1];
//}else{
//    echo 'Please Specify a File';
//    exit(1);
//}

$target_dir = "./";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

//$file = $_FILES["fileToUpload"]["name"];
$file = $target_file;
$img = imagecreatefromstring(file_get_contents("./".$_FILES["fileToUpload"]["name"]));
list($width, $height) = getimagesize($file);
$scale = 6;
$chars = array(
    "&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp","&nbsp",'.','.','\'','`',',', ':',';',
    '|', 'i','~','+','1','t','f','j','r','x','c','z','I','T','S','Y', 'X', '0','*',
    '#','M','W','&','8','%','B','@',
);
$chars = array_reverse($chars);
//$strings = "$@B%8&WM#*oahkbdpqwmO0QLCJUYX";
//$chars = str_split($strings);

$c_count = count($chars);
$color = false;
if($_POST['color'] == 'Yes')
{
    $color = true;
}

for($y = 0; $y <= $height - $scale - 1; $y += $scale) {
    for($x = 0; $x <= $width - ($scale / 2) - 1; $x += ($scale / 2)) {
        $rgb = imagecolorat($img, $x, $y);
        $r = (($rgb >> 16) & 0xFF);
        $g = (($rgb >> 8) & 0xFF);
        $b = ($rgb & 0xFF);
        $sat = ($r + $g + $b) / (255 * 3);

        if ($color) {

        echo '<span style="color:rgb(' . $r . ',' . $g . ',' . $b . ');">' . $chars[(int)($sat * ($c_count - 1))] . '</span>';
        } else {
            echo '<span>' . $chars[(int)($sat * ($c_count - 1))] . '</span>';
        }
    }
    echo PHP_EOL;
}
?></div>

</body>
</html>