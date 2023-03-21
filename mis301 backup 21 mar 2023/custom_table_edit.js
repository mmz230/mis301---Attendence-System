$(document).ready(function(){
$('#data_table').Tabledit({
deleteButton: false,
editButton: false,
columns: {
identifier: [0, 'id'],
editable: [[1, 'studentname'], [2, 'grade'], [3, 'date'], [4, 'section'], [5, 'subject'], [6, 'attendence']]
},
hideIdentifier: true,
url: 'live_edit.php'
});
});