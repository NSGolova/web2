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

$file = $_FILES["fileToUpload"]["tmp_name"];
$img = imagecreatefromstring(file_get_contents($file));
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