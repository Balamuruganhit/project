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

import org.apache.ofbiz.base.util.Debug

// Get the invoiceId from parameters
def invoiceId = parameters.invoiceId

// Fetch the saleOrderId from the Invoice table
def saleOrder = from("Invoice").where("invoiceId", invoiceId).queryOne()
def saleOrderId = saleOrder.salseOrderId
if(saleOrderId){
// Fetch the OrderItem list related to the saleOrderId
    def productList = from("OrderItem").where("orderId", saleOrderId).queryList()
    def orderRole = from("OrderRole").where("orderId",saleOrderId).queryList()
    Debug.logInfo(" partyId " + orderRole, "invoiceSaleOrderGetter")
    for (def orderParty in orderRole) {
        if(orderParty.roleTypeId == "SHIP_TO_CUSTOMER")
        {
            def invoice = from("Invoice").where("invoiceId", invoiceId).queryOne()
            invoice.set("partyId", orderParty.partyId)
            delegator.store(invoice)
            Debug.logInfo(" partyId" + orderParty.partyId, "invoiceSaleOrderGetter")
        }
        
    }
    // Insert each OrderItem as an InvoiceItem
    for (def product in productList) {
        def invoiceItemSeqId = delegator.getNextSeqId("InvoiceItem")
        def invoiceItem = delegator.makeValue("InvoiceItem", [
            "invoiceId"   : invoiceId,
            "invoiceItemSeqId"   : invoiceItemSeqId,
            "productId"   : product.productId,
            "quantity"    : product.quantity,
            "amount"   : product.unitPrice*product.quantity,
            "taxableFlag":"Y",
            "invoiceItemTypeId":"INV_FPROD_ITEM"
        ])
        delegator.create(invoiceItem)
        Debug.logInfo(" items for invoiceItem: " + invoiceItem, "invoiceSaleOrderGetter")
    }
    
    context.successMessage = "Invoice Items added successfully!"
    return "success"
}