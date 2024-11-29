document.addEventListener("DOMContentLoaded", () => {
    const dataTable = document.getElementById("data-table-body");
    const submitButton = document.getElementById("submit-button");
    const addButton = document.getElementById("add-button");

    let formDataArray = [];

    // Add Button Logic
    addButton.addEventListener("click", (event) => {
        event.preventDefault();

        const reportId = document.getElementById("reportId").value;
        const question = document.getElementById("question").value;
        const rating = document.getElementById("rating").value;
        const comment = document.getElementById("comment").value;
        const proofInput = document.getElementById("proof");
        const approve = document.getElementById("approve").checked;

        // Handle File Upload
        const proofFile = proofInput.files[0];
        if (!proofFile) {
            alert("Please select a proof file.");
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            const proofData = e.target.result; // Base64 encoded string

            // Add row to table
            const newRow = `
            <tr>
                <td>${reportId || "N/A"}</td>
                <td>${question || "No question provided"}</td>
                <td>${rating || "No rating"}</td>
                <td>${comment || "No comment"}</td>
                <td>
                    <img src="${proofData || 'default-image.png'}" alt="Proof" style="width: 50px; height: 50px;" />
                </td>
                <td>${approve || 'no'}</td>
            </tr>
        `;
            dataTable.innerHTML += newRow;

            // Store data in array
            formDataArray.push({
                reportId: reportId,
                question: question,
                rating: rating,
                comment: comment,
                proof: proofData,
                approve: approve,
            });

            // Reset Form
            document.getElementById("form").reset();
        };

        // Read file as Base64
        reader.readAsDataURL(proofFile);
    });

    // Submit Button Logic
    submitButton.addEventListener("click", async (event) => {
        event.preventDefault();

        if (formDataArray.length === 0) {
            alert("No data to submit.");
            return;
        }

        try {
            const response = await fetch("<@ofbizUrl>createReportDetail</@ofbizUrl>", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ data: formDataArray }),
            });

            const result = await response.json();
            if (result.responseMessage === "success") {
                alert("Data submitted successfully.");
                formDataArray = []; // Clear data after submission
                dataTable.innerHTML = ""; // Clear table
            } else {
                alert("Error submitting data: " + result.errorMessage);
            }
        } catch (error) {
            console.error("Error:", error);
            alert("An error occurred while submitting the data.");
        }
    });
});
