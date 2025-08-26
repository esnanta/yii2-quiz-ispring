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
        return 'Participant';
    }

    /**
     * Identify the file type of a spreadsheet file
     * @param string $inputFileName
     * @return string|null Returns the file type or null if unable to identify
     */
    public function getIdentify($inputFileName): ?string
    {
        try {
            if (!file_exists($inputFileName)) {
                return null;
            }
            return IOFactory::identify($inputFileName);
        } catch (Exception $e) {
            return null;
        }
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
        foreach ($data->getRowIterator(1) as $row) {
            $cellIterator = $row->getCellIterator();
            $cellIterator->setIterateOnlyExistingCells(false); // Loop all cells, even if it is not set

            $rowList = [];
            foreach ($cellIterator as $cell) {
                // Add all cell values, even null ones, to preserve column structure
                $rowList[] = $cell->getFormattedValue();
            }
            $dataList[] = $rowList;
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
        if (empty($fileData) || empty($fileData[0])) {
            echo '<div class="alert alert-warning">No data or header found in spreadsheet.</div>';
            return;
        }

        // Always use the first row as header
        $headerRow = $fileData[0];

        echo '<div class="table-responsive">';
        echo '<table class="table table-striped table-bordered">';
        echo '<thead class="table-dark"><tr>';
        // Display only the first 4 header columns
        foreach (array_slice($headerRow, 0, 4) as $cellValue) {
            echo '<th class="text-center">' . htmlspecialchars($cellValue ?? 'Column') . '</th>';
        }
        echo '</tr></thead><tbody>';

        // Display data rows, skipping the header
        foreach ($fileData as $rowIndex => $row) {
            if ($rowIndex === 0) continue; // skip header row

            echo '<tr>';
            // Display only the first 4 data columns
            foreach (array_slice($row, 0, 4) as $cellValue) {
                echo '<td>' . htmlspecialchars($cellValue ?? '') . '</td>';
            }
            echo '</tr>';
        }

        echo '</tbody></table>';
        echo '</div>';
    }
}