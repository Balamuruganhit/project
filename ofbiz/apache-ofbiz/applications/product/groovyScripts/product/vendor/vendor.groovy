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
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.Delegator
import org.apache.ofbiz.entity.util.EntityUtil
import static org.apache.ofbiz.base.util.UtilMisc.toMap
long startTime = System.currentTimeMillis()

List<Map> finalList = []
List<GenericValue> supplierProducts = from("SupplierProduct").queryList()

supplierProducts.groupBy { it.partyId }.each { partyId, productList ->
    GenericValue party = from("Party").where("partyId", partyId).queryOne()
    GenericValue partyNameView = from("PartyNameView").where("partyId", partyId).queryFirst()

    String phone = from("PartyContactDetailByPurpose")
        .where("contactMechPurposeTypeId", "PHONE_WORK", "partyId", partyId)
        .queryFirst()?.infoString

    String email = from("PartyContactDetailByPurpose")
        .where("contactMechPurposeTypeId", "PRIMARY_EMAIL", "partyId", partyId)
        .queryFirst()?.infoString

    String website = from("PartyContactDetailByPurpose")
        .where("contactMechPurposeTypeId", "WEB_ADDRESS", "partyId", partyId)
        .queryFirst()?.infoString

    // Add vendor info
    finalList.add([
        rowType       : "party",
        partyId       : partyId,
        partyName     : partyNameView?.groupName ?: "${partyNameView?.firstName} ${partyNameView?.lastName}",
        role          : "SUPPLIER",
        status        : party?.statusId == "PARTY_ENABLED" ? "ACTIVE" : "INACTIVE",
        contactNumber : phone,
        email         : email,
        website       : website,
        
    ])

    // Add each product row under the vendor
    productList.each { sp ->
        GenericValue product = from("Product").where(["productId":sp.productId]).queryOne()

        finalList.add([
            rowType     : "product",
            partNo      : product?.productId,
            partName    : product?.internalName,
            productType : product?.productTypeId,
            
            uom         : sp?.currencyUomId,
            quantity    : sp?.unitsIncluded,
            price       : sp?.lastPrice
        ])
    }
}

context.vendorProductList = finalList

long endTime = System.currentTimeMillis()
long elapsedTime = endTime - startTime
logInfo("VendorManagementScript Execution time: ${elapsedTime} ms")



