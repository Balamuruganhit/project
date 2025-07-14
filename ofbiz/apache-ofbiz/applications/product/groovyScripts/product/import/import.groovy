import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.apache.poi.ss.usermodel.CellType
import java.nio.ByteBuffer
import java.io.ByteArrayInputStream

def uploadExcelAndPrint() {
    final module = "import.groovy"

    
        // ✅ Get the uploaded file from multiPartMap
        def uploadedFile = parameters.uploadFile

        uploadedFile.rewind()

        def bytes = new byte[uploadedFile.remaining()]
        uploadedFile.get(bytes)

        def workbook = new XSSFWorkbook(new ByteArrayInputStream(bytes))
        def sheet = workbook.getSheetAt(0)

        sheet.each { row ->
    row.each { cell ->
        def value
        switch (cell.getCellType()) {
            case CellType.STRING:
                break
            case CellType.NUMERIC:
                value = cell.getNumericCellValue()
                break
            case CellType.BOOLEAN:
                value = cell.getBooleanCellValue()
                break
            default:
                value = "?"
        }
        logInfo("output" +value ) 
    }
    
}
}
