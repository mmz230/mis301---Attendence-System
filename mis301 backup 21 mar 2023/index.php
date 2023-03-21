<?php
require 'config.php';
if(!empty($_SESSION["id"])){
  $id = $_SESSION["id"];
  $result = mysqli_query($conn, "SELECT * FROM tb_user WHERE id = $id");
  $row = mysqli_fetch_assoc($result);
}
else{
  header("Location: login.php");
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Index</title>
  </head>
  <body>
    <h1>Welcome <?php echo $row["name"]; ?></h1>
    <a href="logout.php">Logout</a>
    
    
    <p>
<button onclick="window.location.href='iattend.html'"><a href="iattend.html">Insert Attendence Records</a></button>

</p>
    
      <p>
<button onclick="window.location.href='attend/index.php'"><a href="attend/index.php">Edit Attendence Records</a></button>

</p>
    
    
    
<p>
Other Tables (Not related to above)
<br/>
<button onclick="window.location.href='iattendence.html'"><a href="iattendence.html">Insert Attendence</a></button>
<br/>
<button onclick="window.location.href='istudent.html'"><a href="istudent.html">Insert Student</a></button>
<br/>
<button onclick="window.location.href='idate.html'"><a href="idate.html">Insert Date</a></button>
<br/>
<button onclick="window.location.href='igrade.html'"><a href="igrade.html">Insert Grade</a></button>
<br/>
<button onclick="window.location.href='isubject.html'"><a href="isubject.html">Insert Subject</a></button>
<br/>
For Login adding, just for testing
<br/>
<button onclick="window.location.href='ilogin.html'"><a href="i.html">Insert Login</a></button>
<br/>







</p>
    
  </body>
</html>
