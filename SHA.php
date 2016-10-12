<?php
$salt = "90046dee9";
$str = "akash";
echo sha1($str);
echo "<br/>";
$str = "<br/><div></div>";
echo htmlspecialchars($str,ENT_SUBSTITUTE);
echo "<br>";
$str="1234";
echo sha1($str);
?>