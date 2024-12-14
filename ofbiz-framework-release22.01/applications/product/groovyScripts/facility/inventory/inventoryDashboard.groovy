/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import org.apache.ofbiz.base.util.UtilDateTime
import org.apache.ofbiz.base.util.UtilProperties
import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.entity.condition.EntityConditionBuilder
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.serialize.XmlSerializer
import org.apache.ofbiz.product.product.KeywordIndex
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.entity.condition.*
import org.apache.ofbiz.entity.transaction.*
import org.apache.ofbiz.service.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.entity.*
import java.sql.Timestamp
import java.util.List

Map contentFacility = [:]
inventoryItems=select('facilityTypeId').from('FacilityType').queryList()
idValue=1
inventoryItems.each{itemLists -> 
	Map listValues=[:]
	facilityTypeId = itemLists.get("facilityTypeId")
	singleItem=select('facilityTypeId').from('Facility').where("facilityTypeId", facilityTypeId).queryCount();
	listValues.put("facilityTypeId", facilityTypeId)
	if(singleItem == 0){
		listValues.put("facilityCount", 0)
	}
	else{
		listValues.put("facilityCount", singleItem)
	}
	contentFacility.put(idValue++, listValues)
}

inventoryItemTotals = []
qohGrandTotal = 0.0
atpGrandTotal = 0.0
costPriceGrandTotal = 0.0
retailPriceGrandTotal = 0.0
totalCostPriceGrandTotal = 0.0
totalRetailPriceGrandTotal = 0.0
boolean beganTransaction = false


conditions = [EntityCondition.makeCondition("statusId", EntityOperator.NOT_EQUAL, "INV_DELIVERED")]
conditions.add(EntityCondition.makeCondition("statusId", EntityOperator.EQUALS, null))
conditionList = EntityCondition.makeCondition(conditions, EntityOperator.OR)
try {
    beganTransaction = TransactionUtil.begin()
    invItemListItr = from("InventoryItem").where(conditionList).orderBy("productId").queryIterator()
    invItemListItr.each{ inventoryItem -> 
        productId = inventoryItem.productId
        product = from("Product").where("productId", productId).queryOne()
        productFacility = from("ProductFacility").where("productId", productId).queryOne()
        if (productFacility) {
            quantityOnHandTotal = inventoryItem.getDouble("quantityOnHandTotal")
            availableToPromiseTotal = inventoryItem.getDouble("availableToPromiseTotal")
            costPrice = inventoryItem.getDouble("unitCost")
            retailPrice = 0.0
            totalCostPrice = 0.0
            totalRetailPrice = 0.0
            productPrices = product.getRelated("ProductPrice", null, null, false)
			minimumStock=select('minimumOrderQuantity').from('SupplierProduct').where('productId':productId).queryList()
            if (productPrices) {
                	productPrices.each { productPrice ->
                        if (("DEFAULT_PRICE").equals(productPrice.productPriceTypeId)) {
                            retailPrice = productPrice.getDouble("price")
                        }
                    }
                }
                if (costPrice && quantityOnHandTotal) {
                    totalCostPrice = costPrice * quantityOnHandTotal
                    totalCostPriceGrandTotal += totalCostPrice
                }
                if (retailPrice && quantityOnHandTotal) {
                    totalRetailPrice = retailPrice * quantityOnHandTotal
                    totalRetailPriceGrandTotal += totalRetailPrice
                }
                if (quantityOnHandTotal) {
                    qohGrandTotal += quantityOnHandTotal
                }
                if (availableToPromiseTotal) {
                    atpGrandTotal += availableToPromiseTotal
                }
                if (costPrice) {
                    costPriceGrandTotal += costPrice
                }
                

                resultMap = [productId : product.productId, quantityOnHand : minimumStock, availableToPromise : availableToPromiseTotal,
                             costPrice : costPrice]
                inventoryItemTotals.add(resultMap)    
            }
        }
        invItemListItr.close()
    } catch (GenericEntityException e) {
        errMsg = "Failure in operation, rolling back transaction"
        logError(e, errMsg)
        try {
            // only rollback the transaction if we started one...
            TransactionUtil.rollback(beganTransaction, errMsg, e)
        } catch (GenericEntityException e2) {
            logError(e2, "Could not rollback transaction: " + e2.toString())
        }
        // after rolling back, rethrow the exception
        throw e
    } finally {
        // only commit the transaction if we started one... this will throw an exception if it fails
        TransactionUtil.commit(beganTransaction)
}



context.inventoryItemTotals = inventoryItemTotals


context.itemsList=contentFacility.values().toList()
context.faculityList=inventoryItems