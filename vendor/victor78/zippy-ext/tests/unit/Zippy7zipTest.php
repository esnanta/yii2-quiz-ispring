<?php

namespace tests\unit;

require_once 'ZippyTesting.php';

class Zippy7zipTest extends ZippyTesting
{
    
    public function __construct() {
        parent::__construct();
        $this->type = '7zip';
        $this->ext = 'zip';
    }
}
