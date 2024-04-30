<?php

namespace common\domain;

use common\helper\ReadFilter;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;

class DataSpreadsheetUseCase
{
    private static ?DataSpreadsheetUseCase $instance = null;

    public static function getInstance(): DataSpreadsheetUseCase{
        if (self::$instance === null) {
            self::$instance = new DataSpreadsheetUseCase();
        }
        return self::$instance;
    }

    public function getReader($inputFileName, $sheetName){
        $filterSubset = new ReadFilter();

        $inputFileType = IOFactory::identify($inputFileName);
        $reader = IOFactory::createReader($inputFileType);
        $reader->setReadDataOnly(true); //THIS WILL IGNORE FORMATTING
        $reader->setLoadSheetsOnly($sheetName);
        $reader->setReadFilter($filterSubset);

        return $reader;
    }

    public function getHelper(): Sample
    {
        return new Sample();
    }

    public function getSheetName(): String {
        return 'Participant';
    }

    public function getIdentify($inputFileName): string
    {
        return IOFactory::identify($inputFileName);
    }
}