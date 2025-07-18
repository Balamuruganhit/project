
<#if availableProduct?has_content>
<table class="product-table">
  <thead>
    <tr>
      <th>Product Name</th>
    </tr>
  </thead>
  <tbody>
    <#list availableProduct as product>
      <tr>
        <td>${product!""}</td>
      </tr>
    </#list>
  </tbody>
</table>
<#else>

</#if>

<style>
  .product-table {
    width: 100%;
    border-collapse: collapse;
    margin: 1rem 0;
    font-family: Arial, sans-serif;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }

  .product-table th, .product-table td {
    padding: 12px 16px;
    border: 1px solid #ddd;
    text-align: left;
  }

  .product-table th {
    background-color: #f4f4f4;
    color: #333;
    font-weight: 600;
  }

  .product-table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
  }

  .product-table tbody tr:hover {
    background-color: #eef;
  }

  .product-table .highlight {
    background-color: #ffd70026;
    font-weight: bold;
  }
</style>