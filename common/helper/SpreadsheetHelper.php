<?php

namespace common\helper;

use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use PhpOffice\PhpSpreadsheet\Reader\IReader;

class SpreadsheetHelper extends Sample
{
    private static ?SpreadsheetHelper $instance = null;

    public static function getInstance(): SpreadsheetHelper{
        if (self::$instance === null) {
            self::$instance = new SpreadsheetHelper();
        }
        return self::$instance;
    }

    /**
     * @throws Exception
     */
    public function getReader($inputFileName, $sheetName): IReader
    {
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

    public function getDataList($data): array
    {
        $dataList = [];
        //$data->getRowIterator(1) = START FROM ROW 1
        foreach ($data->getRowIterator(1) as $row) {
            $cellIterator = $row->getCellIterator();

            /*
             * setIterateOnlyExistingCells
             * Default value is 'false'
             * FALSE = This loops through all cells, even if a cell value is not set.
             * TRUE = Loop through cells only when their value is set.
             */
            $cellIterator->setIterateOnlyExistingCells(FALSE);

            //$counter = 0;
            $rowList = [];
            foreach ($cellIterator as $i=>$cell) {
                if($i !=  'A' && $cell->getValue() != null){
                    $rowList[] = $cell->getFormattedValue();
                }
                $dataList[] = $rowList;
            }
        }
        return $dataList;
    }
}