 <?php
require 'config.php';
// if(!empty($_SESSION["id"])){
//   $id = $_SESSION["id"];
//   $result = mysqli_query($conn, "SELECT * FROM tb_user WHERE id = $id");
//   $row = mysqli_fetch_assoc($result);
// }
// else{
//   header("Location: login.php");
// }
 ?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="dist/jquery.tabledit.js"></script>
<script type="text/javascript" src="custom_table_edit.js"></script>
    
<table id="data_table" class="table table-striped">
<thead>
<tr>
<th>id</th>
<th>studentname</th>
<th>grade</th>
<th>Date</th>
<th>section</th>
<th>subject</th>
<th>attendence</th>
</tr>
</thead>
<tbody>
<?php
$sql_query = "SELECT id, studentname, grade, date, section, subject, attendence FROM attend LIMIT 10";
$resultset = mysqli_query($conn, $sql_query) or die("database error: id1". mysqli_error($conn));
while( $attend = mysqli_fetch_assoc($resultset) ) {
?>
<tr id="<?php echo $attend ['id']; ?>">
<td><?php echo $attend ['id']; ?></td>
<td><?php echo $attend ['studentname']; ?></td>
<td><?php echo $attend ['grade']; ?></td>
<td><?php echo $attend ['date']; ?></td>
<td><?php echo $attend ['section']; ?></td>
<td><?php echo $attend ['subject']; ?></td>
<td><?php echo $attend ['attendence']; ?></td>
</tr>
<?php } ?>
</tbody>
</table>