import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.apache.poi.ss.usermodel.CellType
import java.nio.ByteBuffer
import org.apache.ofbiz.service.ServiceUtil;

import java.io.ByteArrayInputStream
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.CellType
import org.apache.poi.ss.usermodel.DateUtil
import org.apache.poi.ss.usermodel.FormulaEvaluator
import org.apache.poi.ss.util.NumberToTextConverter

def uploadRoutingTask() {
    final module = "import.groovy"
    try{
    Map<String, Object> result = ServiceUtil.returnSuccess();
        // ✅ Get the uploaded file from multiPartMap
        def uploadedFile = parameters.uploadFile
        logInfo("It is get" + uploadedFile)
        uploadedFile.rewind()

        def bytes = new byte[uploadedFile.remaining()]
        uploadedFile.get(bytes)

        def workbook = new XSSFWorkbook(new ByteArrayInputStream(bytes))
        def sheet = workbook.getSheetAt(0)
      
    List<String> headers = ["workEffortName", "workEffortPurposeTypeId", "description", "fixedAssetId","estimatedSetupMillis","estimatedMilliSeconds","reservPersons"]
    permUserLogin = from("UserLogin").where("userLoginId", "system").queryOne();
   List availableList=[]
    List<Map> dataList = []

  
    for (int i = 1; i <= sheet.getLastRowNum(); i++) {
        Row row = sheet.getRow(i)
        if (row == null) continue

        Map rowMap = [:]
        headers.eachWithIndex { header, index ->
            def cell = row.getCell(index)
            def value = ""

            if (cell != null) {
                switch (cell.getCellType()) {
                    case CellType.STRING:
                        value = cell.getStringCellValue()
                        break
                    case CellType.NUMERIC:
                        if (DateUtil.isCellDateFormatted(cell)) {
                            value = cell.getDateCellValue().toString()
                        } else {
                            value = NumberToTextConverter.toText(cell.getNumericCellValue())
                        }
                        break
                    case CellType.BOOLEAN:
                        value = cell.getBooleanCellValue().toString()
                        break
                    case CellType.FORMULA:
                        FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator()
                        def evaluated = evaluator.evaluate(cell)
                        switch (evaluated.getCellType()) {
                            case CellType.NUMERIC:
                                value = NumberToTextConverter.toText(evaluated.getNumberValue())
                                break
                            case CellType.STRING:
                                value = evaluated.getStringValue()
                                break
                            case CellType.BOOLEAN:
                                value = evaluated.getBooleanValue().toString()
                                break
                            default:
                                value = "?"
                        }
                        break
                    default:
                        value = ""
                }
            }

            rowMap[header] = value
            
                def typeMap = [
                    "Manufacturing": "ROU_MANUFACTURING",
                    "Assembling": "ROU_ASSEMBLING",
                    "Sub-contracting":"ROU_SUBCONTRACTING",
                ]
                if (typeMap.containsKey(rowMap.workEffortPurposeTypeId)) {
                    rowMap.workEffortPurposeTypeId = typeMap[rowMap.workEffortPurposeTypeId]
                }
       
        }
         workEffort=from('workEffort').where('workEffortName',rowMap.workEffortName).queryOne()
        if(workEffort){
             logInfo("Available product +${product}")
            availableList.add(rowMap.internalName)
            logInfo("It are create from available list")
        }
        else{
        rowMap["userLogin"] = permUserLogin
        if(rowMap.workEffortPurposeTypeId){
                    
        }
        else{
            rowMap.workEffortPurposeTypeId = "ROU_MANUFACTURING"
        }
        rowMap.currentStatusId="ROU_ACTIVE"
        rowMap.workEffortTypeId="ROU_TASK"
        rowMap.estimateCalcMethod="6000"
        dataList.add(rowMap)
        Map serviceResult = dispatcher.runSync("createWorkEffort", rowMap)
        }
    }
    dataList.each { row ->
                logInfo("Row map: ${row}")
            
            }
    result.put("availableProduct", availableList)
    result.put("successMessage", "Excel Data Import successfully ${dataList.size()}")
    return result
        
       
        
    }
    catch (Exception e) {
        logError(e, "Error in uploadExcelAndPrint service")
        return ServiceUtil.returnError("No file is Upload")
    }
}
