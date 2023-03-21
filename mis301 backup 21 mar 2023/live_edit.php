

<?php
include_once("db_connect.php");
$input = filter_input_array(INPUT_POST);
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['studentname'])) {
$update_field.= "studentname='".$input['studentname']."'";
} else if(isset($input['grade'])) {
$update_field.= "grade='".$input['grade']."'";
} else if(isset($input['date'])) {
$update_field.= "date='".$input['date']."'";
} else if(isset($input['section'])) {
$update_field.= "section='".$input['section']."'";
} else if(isset($input['subject'])) {
$update_field.= "subject='".$input['subject']."'";
}else if(isset($input['attendence'])) {
$update_field.= "attendence='".$input['attendence']."'";
}
    
if($update_field && $input['id']) {
$sql_query = "UPDATE attend SET $update_field WHERE id='" . $input['id'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}
?>