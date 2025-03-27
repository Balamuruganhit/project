import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.content.content.ContentServices
import org.apache.ofbiz.service.ServiceUtil

def uploadDocument(Map context) {
    def documentText = context.documentText
    def uploadedFile = context.uploadedFile
    def fileName = context._uploadedFile_fileName
    def contentType = context._uploadedFile_contentType

    if (UtilValidate.isEmpty(uploadedFile) || !fileName.endsWith(".pdf")) {
        return ServiceUtil.returnError("Please upload a PDF file.")
    }

    // Call OFBiz's createContent service to save the document as a content record
    Map contentCtx = [
        contentName: fileName,
        contentTypeId: "DOCUMENT",
        dataResourceTypeId: "LOCAL_FILE",
        mimeTypeId: contentType,
        textData: documentText
    ]

    def contentResult = dispatcher.runSync("createContent", contentCtx)
    if (!ServiceUtil.isSuccess(contentResult)) {
        return ServiceUtil.returnError("Failed to create content.")
    }

    def contentId = contentResult.contentId

    // Use OFBiz's addContentAndDataResource service to link file data
    Map dataResourceCtx = [
        contentId: contentId,
        dataResourceName: fileName,
        mimeTypeId: contentType,
        objectInfo: "applications/content/documents/${contentId}.pdf"
    ]
    
    def dataResourceResult = dispatcher.runSync("createDataResource", dataResourceCtx)
    if (!ServiceUtil.isSuccess(dataResourceResult)) {
        return ServiceUtil.returnError("Failed to create data resource.")
    }

    return ServiceUtil.returnSuccess("Document uploaded successfully", [contentId: contentId])
}
