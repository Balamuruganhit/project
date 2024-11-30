// Initialize an array to hold form data
let formDataArray = [];

// Function to collect form data and display in a table when "Add" button is pressed
function addFormData() {
    // Collect form inputs
    const reportId = document.getElementById('reportId').value;
    const question = document.getElementById('question').value;
    const rating = document.getElementById('rating').value;
    const comment = document.getElementById('comment').value;
    const approve = document.getElementById('approve').checked ? 'Yes' : 'No';
    const proof = document.getElementById('proof').files[0]; // Get the file object

    // Create an object for the form data
    const formData = {
        reportId: reportId,
        question: question,
        rating: rating,
        comment: comment,
        approve: approve,
        proof: proof // Store the file object
    };

    // Add the object to the array
    formDataArray.push(formData);

    // Display the data in the table
    displayFormData(formData);
}

// Function to display form data in a table
function displayFormData(data) {
    let table = document.getElementById('dataTable'); // Table with id "formDataTable"
    let newRow = table.insertRow();

    newRow.insertCell(0).innerText = data.reportId;
    newRow.insertCell(1).innerText = data.question;
    newRow.insertCell(2).innerText = data.rating;
    newRow.insertCell(3).innerText = data.comment;
    newRow.insertCell(4).innerText = data.approve;

    // Handle the display of the proof image
    if (data.proof) {
        const reader = new FileReader();
        reader.onload = function(event) {
            let imgCell = newRow.insertCell(5);
            let img = document.createElement('img');
            img.src = event.target.result; // Set image source
            img.style.width = '50px';
            img.style.height = '50px';
            imgCell.appendChild(img);
        };
        reader.readAsDataURL(data.proof); // Read the file as a Data URL
    } else {
        newRow.insertCell(5).innerText = 'No Image';
    }
}

// Function to send all form data to the backend when "Submit" button is pressed
function submitFormData() {
    // Loop through the formDataArray and send each item
    formDataArray.forEach((data, index) => {
        let formData = new FormData();

        // Append all fields to FormData
        formData.append('reportId', data.reportId);
        formData.append('question', data.question);
        formData.append('rating', data.rating);
        formData.append('comment', data.comment);
        formData.append('approve', data.approve);

        // Append the proof file if available
        if (data.proof) {
            formData.append('proof', data.proof);
        }

        // Send the formData to the backend via AJAX
        let xhr = new XMLHttpRequest();
        xhr.open('POST', '/AuditReport/control/createReportDetail', true);

        xhr.onload = function() {
            if (xhr.status === 200) {
                console.log(`Record ${index + 1} submitted successfully.`);
                // Optionally, you can clear the formDataArray here after successful submission
            } else {
                console.error(`Error submitting record ${index + 1}: ${xhr.statusText}`);
            }
        };

        xhr.onerror = function() {
            console.error(`Request failed for record ${index + 1}`);
        };

        xhr.send(formData); // Send the form data
    });
}

// Event listeners for buttons
document.getElementById('addButton').addEventListener('click', addFormData); // "Add" button
document.getElementById('submitButton').addEventListener('click', submitFormData); // "Submit" button
