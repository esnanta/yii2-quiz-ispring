<?php

namespace common\helper;

use PhpOffice\PhpSpreadsheet\Reader\IReadFilter;

class ReadFilter implements IReadFilter
{

    public function readCell ($columnAddress, $row, $worksheetName = ''): bool
    {
        // Read rows 9 to 15 and columns A to E only
        if ($row >= 6 && $row <= 36) {
            if (in_array($columnAddress, range('C', 'D'))) {
                return true;
            }
        }

        return false;
    }
}