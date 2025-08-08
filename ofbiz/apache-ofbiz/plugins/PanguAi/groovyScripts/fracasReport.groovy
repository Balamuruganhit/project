import org.apache.ofbiz.base.util.UtilDateTime
import org.apache.ofbiz.base.util.UtilProperties
import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator
import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.entity.condition.EntityConditionBuilder
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.serialize.XmlSerializer
import org.apache.ofbiz.product.product.KeywordIndex
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.service.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.entity.*
import java.sql.Timestamp
import java.util.List
import java.text.SimpleDateFormat
if(parameters.approver == 'update'){
if(parameters.system || parameters.subSystem||parameters.subSubSystem||parameters.partNumber||parameters.startWarrantyDate || parameters.prototype||parameters.fromDate){
    def conditions = []
    def condition=null

        if (parameters.system) {
            conditions << EntityCondition.makeCondition("system", EntityOperator.LIKE,"%" + parameters.system+ "%")
        }
        if (parameters.subSystem) {
            conditions << EntityCondition.makeCondition("subsystem", EntityOperator.LIKE,"%" + parameters.subSystem+ "%")
        }
        if (parameters.subSubSystem) {
            conditions << EntityCondition.makeCondition("subsubsystem", EntityOperator.LIKE,"%" + parameters.subSubSystem+ "%")
        }
        if (parameters.partNumber) {
            conditions << EntityCondition.makeCondition("partNumber", EntityOperator.LIKE, "%" + parameters.partNumber + "%")
        }
        // if (parameters.prototype) {
        //     conditions << EntityCondition.makeCondition("prototype", EntityOperator.LIKE, "%" + parameters.prototype + "%")
        // }
         
        if (parameters.startWarrantyDate) {
            try {
                def sdf = new SimpleDateFormat("yyyy-MM-dd")
                sdf.setLenient(false) // enforce strict format parsing
                def utilDate = sdf.parse(parameters.startWarrantyDate.trim())
                def startTimestamp = new Timestamp(utilDate.getTime())
                Calendar cal = Calendar.getInstance()
                cal.setTime(utilDate)
                cal.add(Calendar.DAY_OF_MONTH, 1)
                def endTimestamp = new Timestamp(cal.getTimeInMillis())

                logInfo("Searching between: ${startTimestamp} and ${endTimestamp}")
                
                // Add to query condition
                conditions << EntityCondition.makeCondition([
                    EntityCondition.makeCondition("startWarranty", EntityOperator.GREATER_THAN_EQUAL_TO, startTimestamp),
                    EntityCondition.makeCondition("endWarranty", EntityOperator.LESS_THAN, endTimestamp)
                ], EntityOperator.AND)
            } catch (Exception e) {
                logError("Failed to parse date_fld0_value: ${parameters.date_fld0_value}, Error: ${e.message}")
            }
            if (parameters.fromDate) {
            try {
                def sdf = new SimpleDateFormat("yyyy-MM-dd")
                sdf.setLenient(false) // enforce strict format parsing
                def utilDate = sdf.parse(parameters.fromDate.trim())
                def startTimestamp = new Timestamp(utilDate.getTime())
                Calendar cal = Calendar.getInstance()
                cal.setTime(utilDate)
                cal.add(Calendar.DAY_OF_MONTH, 1)
                def endTimestamp = new Timestamp(cal.getTimeInMillis())

                logInfo("Searching between: ${startTimestamp} and ${endTimestamp}")
                
                // Add to query condition
                conditions << EntityCondition.makeCondition([
                    EntityCondition.makeCondition("lastUpdatedStamp", EntityOperator.GREATER_THAN_EQUAL_TO, startTimestamp),
                    EntityCondition.makeCondition("lastUpdatedStamp", EntityOperator.LESS_THAN, endTimestamp)
                ], EntityOperator.AND)
            } catch (Exception e) {
                logError("Failed to parse date_fld0_value: ${parameters.date_fld0_value}, Error: ${e.message}")
            }
        }
        }

        if (conditions) {
            condition = EntityCondition.makeCondition(conditions, EntityOperator.AND)
    }

// Now query only with .where(condition) if condition is not null:

    def query = from("fracasDetails")
    if (condition != null) {
        query = query.where(condition)
    }
    def ramsList = query.queryList()
    context.ramsList = ramsList
    logInfo("It will run on the condition" +ramsList )
}
else{
    def query = from("fracasDetails")
    def ramsList = query.queryList()
    context.ramsList = ramsList
    logInfo("It will run out of condition")
}
}


fracasNo=parameters.reportNumber
logInfo("report no"+fracasNo)
if(fracasNo){
    fematitle=from( 'fracasDetails').where('reportNumber',fracasNo).queryOne()
    context.ramsOutputTitle=fematitle
    logInfo('It is working Fine' + fematitle)
}
logInfo('it is working fracasreport')