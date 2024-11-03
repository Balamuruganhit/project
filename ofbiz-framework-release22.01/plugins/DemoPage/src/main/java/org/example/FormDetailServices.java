package org.example;

import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.ServiceUtil;
import java.sql.Timestamp;
import java.util.Map;

public class FormDetailServices {
    public static Map<String, Object> submitFormDetail(DispatchContext dctx, Map<String, ? extends Object> context) {
        Delegator delegator = dctx.getDelegator();
        String name = (String) context.get("UserName");
        String email = (String) context.get("UserAddress");
        String message = (String) context.get("UserMobile");
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        try {
            // Create a new GenericValue object for FormDetail
            GenericValue formDetail = delegator.makeValue("CollectCustomerDetail");
        
            formDetail.set("name", name);
            formDetail.set("email", email);
            formDetail.set("message", message);
            

            // Store the entity in the database
            formDetail.create();

            // Optionally, create a ProcessedDetail record
            GenericValue processedDetail = delegator.makeValue("ProcessedDetail");
            processedDetail.set("processedDetailId", delegator.getNextSeqId("ProcessedDetail"));
            processedDetail.set("formDetailId", formDetail.get("formDetailId"));
            processedDetail.set("status", "PENDING");
            processedDetail.set("processedDate", createdDate);

            processedDetail.create();

            return ServiceUtil.returnSuccess("Form details saved successfully");
        } catch (Exception e) {
            return ServiceUtil.returnError("Error saving form details: " + e.getMessage());
        }
    }
}
