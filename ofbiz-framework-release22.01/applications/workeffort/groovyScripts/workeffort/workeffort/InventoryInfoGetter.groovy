/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License") you may not use this file except in compliance
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
import org.apache.ofbiz.entity.condition.*
import org.apache.ofbiz.entity.util.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.base.util.Debug

        Debug.logInfo("DEBUG: WorkEffortId = " + parameters.workEffortId, "InventoryInfoGetter")

        productList = from("WorkEffortGoodStandard")
            .select("productId")
            .where("workEffortId", parameters.workEffortId)
            .queryList()

        Debug.logInfo("DEBUG: Retrieved productList = " + productList, "InventoryInfoGetter")

        

        productList.each { product ->
            productId = product.productId
            Debug.logInfo("DEBUG: Processing productId = " + productId, "InventoryInfoGetter")

            inventoryItems = from("InventoryItemAndDetail")
                .select("quantityOnHandTotal", "availableToPromiseTotal")
                .where("productId", productId)
                .queryList()

            Debug.logInfo("DEBUG: Retrieved inventoryItems = " + inventoryItems, "InventoryInfoGetter")

            inventoryItems.each { inventory ->
                atp = inventory.availableToPromiseTotal ?: 0
                qht = inventory.quantityOnHandTotal ?: 0

                Debug.logInfo("DEBUG: ATP = " + atp + ", QHT = " + qht + " for productId = " + productId, "InventoryInfoGetter")
                workEffortGoodStandard = from("WorkEffortGoodStandard")
                .where("workEffortId", workEffortId, "productId", productId)
                .queryOne()
                if (workEffortGoodStandard) {
                    workEffortGoodStandard.set("atp", atp)
                    workEffortGoodStandard.set("qht", qht)
                    workEffortGoodStandard.store()
                    Debug.logInfo("Updated WorkEffortGoodStandard for productId = " + productId, "InventoryInfoGetter")
                } else {
                    Debug.logWarning("No WorkEffortGoodStandard record found for productId = " + productId, "InventoryInfoGetter")
                }
                
            }
            
        }

        

        // ✅ Store the result in context so the form can use it
        
        return "success"



