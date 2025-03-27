package org.apache.ofbiz.manufacturing.audit;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.entity.condition.EntityCondition;
import org.apache.ofbiz.entity.condition.EntityOperator;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;


import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.content.data.DataResourceWorker;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;
import java.io.OutputStream;

public class StoreServices {
	private static final String module = StoreServices.class.getName();
	
	/** Updates the product's low level code (llc)
     * Given a product id, computes and updates the product's low level code (field billOfMaterialLevel in Product entity).
     * It also updates the llc of all the product's descendants.
     * For the llc only the manufacturing bom ("MANUF_COMPONENT") is considered.
     * @param dctx the distach context
     * @param context the context
     * @return the results of the updates the product's low level code
    */
	public static Map<String, Object> uploadPdfToDatabaseService(DispatchContext dctx,
    Map<String, ? extends Object> context) {
    LocalDispatcher dispatcher = dctx.getDispatcher();
    Delegator delegator = dctx.getDelegator();
    byte[] uploadedFile = (byte[]) context.get("uploadedFile");  // The uploaded PDF file
    String textAreaField = (String) context.get("textAreaField"); // Text area content
    Locale locale = (Locale) context.get("locale");
    // Define a content ID (can be customized)
    String contentId = "plantProductionDocument";  
    String description = "Production Layout Document";

    try {
        // Create Content entity to store text area content
        GenericValue content = delegator.makeValue("Content", UtilMisc.toMap(
            "contentId", delegator.getNextSeqId("Content"),
            "contentTypeId", "DOCUMENT",
            "description", textAreaField, // Store text area content
            "statusId", "CTNT_AVAILABLE", // Content status
            "dataResourceId", contentId
        ));
        content.create();

        // Create DataResource entity for the uploaded file (PDF)
        GenericValue dataResource = delegator.makeValue("DataResource", UtilMisc.toMap(
            "dataResourceId", content.get("dataResourceId"),
            "dataResourceTypeId", "LOCAL_FILE",
            "mimeTypeId", "application/pdf",  // MIME type for PDF
            "dataResourceName", "Uploaded PDF"
        ));
        dataResource.create();

        // Link uploaded file content
        DataResourceWorker.writeDataResourceFile(dataResource, uploadedFile); // Method to save the file content

    } catch (GenericEntityException e) {
        Debug.logError(e, "Error uploading production layout: " + e.getMessage(), module);
        return ServiceUtil.returnError("Error uploading production layout: " + e.getMessage());
    }

    return ServiceUtil.returnSuccess("Uploaded successfully");
}
public static Map<String, Object> listProductionPlantDocuments(DispatchContext dctx, Map<String, Object> context) {
	Delegator delegator = dctx.getDelegator();
	Map<String, Object> result = ServiceUtil.returnSuccess();

	try {
		// Entity condition where contentId = "plantproduction"
		EntityCondition condition = EntityCondition.makeCondition("contentId", EntityOperator.EQUALS, "plantProductionDocument");
		
		// Query to get the list of content (fields you want to display)
		List<GenericValue> contentList = delegator.findList("Content", condition, UtilMisc.toSet("contentId", "dataResourceId", "description"), null, null, false);
		
		// Add the result to the map to be used in the UI
		result.put("contentList", contentList);
	} catch (GenericEntityException e) {
		Debug.logError(e, "Error fetching production plant documents: " + e.getMessage(), module);
		return ServiceUtil.returnError("Error fetching production plant documents: " + e.getMessage());
	}

	return result;
}
     public static Map<String, Object> viewPDF(DispatchContext dctx, Map<String, Object> context) {
        Delegator delegator = dctx.getDelegator();
        HttpServletResponse response = (HttpServletResponse) context.get("response");
        String dataResourceId = (String) context.get("dataResourceId");

        try {
            // Retrieve the DataResource by dataResourceId
            GenericValue dataResource = delegator.findOne("DataResource", UtilMisc.toMap("dataResourceId", dataResourceId), false);

            if (dataResource != null) {
                // Get the file path for the PDF (adjust this according to your storage location)
                String filePath = "/path/to/your/uploads/" + dataResource.getString("dataResourceId"); // Example path

                File file = new File(filePath);
                if (file.exists()) {
                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "inline; filename=" + file.getName());

                    // Send the PDF file to the response output stream
                    try (FileInputStream fileInputStream = new FileInputStream(file);
                         OutputStream outStream = response.getOutputStream()) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                            outStream.write(buffer, 0, bytesRead);
                        }
                    }
                } else {
                    response.getWriter().write("File not found.");
                }
            } else {
                response.getWriter().write("DataResource not found.");
            }
        } catch (Exception e) {
            return ServiceUtil.returnError("Error viewing PDF: " + e.getMessage());
        }

        return ServiceUtil.returnSuccess();
    }
}
