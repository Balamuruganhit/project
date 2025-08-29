

import org.apache.ofbiz.base.util.Debug
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.order.shoppingcart.ShoppingCartEvents
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

Debug.logInfo("Starting requestItem.groovy script...", "requestItem")

// Ensure request and response objects are available from context
HttpServletRequest request = context.request
HttpServletResponse response = context.response

// Retrieve the custRequestId from request parameters
String requestId = parameters.custRequestId

if (!requestId) {
    Debug.logError("custRequestId is missing!", "requestItem")
    return
}

Debug.logInfo("Received custRequestId: " + requestId, "requestItem")

// Fetch all CustRequestItem records from the database
List<GenericValue> requestItems = from("CustRequestItem").where("custRequestId", requestId).queryList()

if (!requestItems || requestItems.isEmpty()) {
    Debug.logError("No items found for custRequestId: " + requestId, "requestItem")
    return
}

Debug.logInfo("Found ${requestItems.size()} items for custRequestId: " + requestId, "requestItem")

// Iterate over the requestItems and add each product to the shopping cart
requestItems.each { requestItem ->
    String productId = requestItem.getString("productId")
    BigDecimal quantity = requestItem.getBigDecimal("quantity") ?: BigDecimal.ONE  // Default to 1 if null

    Debug.logInfo("Adding to cart: ProductID = ${productId}, Quantity = ${quantity}", "requestItem")

    // Set required request parameters
    request.setAttribute("add_product_id", productId)
    request.setAttribute("quantity", quantity.toString())

    // Call the Java event ShoppingCartEvents.addToCart
    String result = ShoppingCartEvents.addToCart(request, response)

    Debug.logInfo("Result from addToCart for product ${productId}: ${result}", "requestItem")
}

Debug.logInfo("Finished processing requestItem.groovy", "requestItem")

