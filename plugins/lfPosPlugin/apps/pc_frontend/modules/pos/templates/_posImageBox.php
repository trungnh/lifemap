<?php
$options = array(
  'object'   => $position,  
  'class' => 'memberImageBox',
  'test' =>$test
);
op_include_parts('posImageBox', 'memberImageBox_'.$position->getId(), $options);
