<?php

namespace common\helper;

use PhpOffice\PhpSpreadsheet\Reader\IReadFilter;

class ReadFilter implements IReadFilter
{

    public function readCell ($columnAddress, $row, $worksheetName = ''): bool
    {
        // Read rows 1 to 50 (including header) and columns A to D only
        if ($row >= 1 && $row <= 20) {
            if (in_array($columnAddress, range('A', 'D'))) {
                return true;
            }
        }

        return false;
    }
}