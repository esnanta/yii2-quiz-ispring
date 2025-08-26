<?php

namespace common\helper;

use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use PhpOffice\PhpSpreadsheet\Reader\IReader;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use common\helper\ReadFilter;

class SpreadsheetHelper extends Sample
{
    private static ?SpreadsheetHelper $instance = null;

    // Supported spreadsheet formats
    private const SUPPORTED_FORMATS = [
        'Xlsx', 'Xls', 'Ods', 'Csv', 'Slk', 'Gnumeric', 'Html'
    ];

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
        // Validate file exists
        if (!file_exists($inputFileName)) {
            throw new Exception("File not found: {$inputFileName}");
        }

        $filterSubset = new ReadFilter();

        try {
            $inputFileType = IOFactory::identify($inputFileName);

            // Validate if the file type is supported
            if (!in_array($inputFileType, self::SUPPORTED_FORMATS)) {
                throw new Exception("Unsupported file format: {$inputFileType}");
            }

            $reader = IOFactory::createReader($inputFileType);
            $reader->setReadDataOnly(true); //THIS WILL IGNORE FORMATTING

            // For some formats like CSV, sheet names don't apply
            if ($inputFileType !== 'Csv' && $inputFileType !== 'Slk') {
                try {
                    $reader->setLoadSheetsOnly($sheetName);
                } catch (Exception $e) {
                    // If specific sheet doesn't exist, load the first sheet
                    // This will be handled when loading the spreadsheet
                }
            }

            $reader->setReadFilter($filterSubset);

            return $reader;
        } catch (Exception $e) {
            throw new Exception("Error creating reader for file {$inputFileName}: " . $e->getMessage());
        }
    }

    /**
     * Get available sheet names from the file
     * @param string $inputFileName
     * @return array
     * @throws Exception
     */
    public function getSheetNames($inputFileName): array
    {
        try {
            $inputFileType = IOFactory::identify($inputFileName);
            $reader = IOFactory::createReader($inputFileType);
            return $reader->listWorksheetNames($inputFileName);
        } catch (Exception $e) {
            // For files like CSV that don't have named sheets
            return ['Sheet1'];
        }
    }

    /**
     * Load spreadsheet with fallback for sheet selection
     * @param string $inputFileName
     * @param string $preferredSheetName
     * @return Spreadsheet
     * @throws Exception
     */
    public function loadSpreadsheet($inputFileName, $preferredSheetName = null): Spreadsheet
    {
        $reader = $this->getReader($inputFileName, $preferredSheetName ?: $this->getSheetName());

        try {
            return $reader->load($inputFileName);
        } catch (Exception $e) {
            // If preferred sheet fails, try loading without sheet restriction
            $inputFileType = IOFactory::identify($inputFileName);
            $fallbackReader = IOFactory::createReader($inputFileType);
            $fallbackReader->setReadDataOnly(true);
            $fallbackReader->setReadFilter(new ReadFilter());

            return $fallbackReader->load($inputFileName);
        }
    }

    public function getHelper(): Sample
    {
        return new Sample();
    }

    public function getSheetName(): String {
        return 'Profile-User';
    }

    public function getIdentify($inputFileName): string
    {
        return IOFactory::identify($inputFileName);
    }

    /**
     * Check if file format is supported
     * @param string $inputFileName
     * @return bool
     */
    public function isSupportedFormat($inputFileName): bool
    {
        try {
            $inputFileType = IOFactory::identify($inputFileName);
            return in_array($inputFileType, self::SUPPORTED_FORMATS);
        } catch (Exception $e) {
            return false;
        }
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

    /**
     * Get supported file extensions
     * @return array
     */
    public static function getSupportedExtensions(): array
    {
        return ['xlsx', 'xls', 'ods', 'csv', 'xlsm', 'xlsb', 'slk', 'gnumeric', 'html', 'htm'];
    }

    /**
     * Display spreadsheet data in a grid format
     * @param array $fileData
     * @return void
     */
    public function displayGrid($fileData): void
    {
        if (empty($fileData)) {
            echo '<div class="alert alert-warning">No data found in spreadsheet</div>';
            return;
        }

        echo '<div class="table-responsive">';
        echo '<table class="table table-bordered table-striped table-sm">';

        $isFirstRow = true;
        foreach ($fileData as $rowIndex => $row) {
            if ($isFirstRow) {
                echo '<thead class="thead-dark"><tr>';
                foreach ($row as $cellValue) {
                    echo '<th>' . htmlspecialchars($cellValue ?? '') . '</th>';
                }
                echo '</tr></thead><tbody>';
                $isFirstRow = false;
            } else {
                echo '<tr>';
                foreach ($row as $cellValue) {
                    echo '<td>' . htmlspecialchars($cellValue ?? '') . '</td>';
                }
                echo '</tr>';
            }
        }

        echo '</tbody></table>';
        echo '</div>';
    }
}