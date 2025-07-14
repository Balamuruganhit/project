
    
    document.addEventListener("DOMContentLoaded", () => {
let currentCell = null;

  function openEditor(cell) {
        currentCell = cell;
        document.getElementById('editorTextarea').value = cell.innerText.trim();
        const modal = document.getElementById('editorModal');
        modal.classList.add('show');
        setTimeout(() => {
            document.getElementById('editorTextarea').focus();
        }, 150);
    }

    function closeEditor(save) {
        const modal = document.getElementById('editorModal');
        const text = document.getElementById('editorTextarea').value;
        if (save && currentCell) {
            currentCell.innerText = text;
        }
        modal.classList.remove('show');
        setTimeout(() => {
            modal.style.display = 'none';
        }, 300); // match transition time
    }

// Apply to each cell
    document.querySelectorAll('.cell-editable').forEach(cell => {
        cell.addEventListener('click', function () {
            const modal = document.getElementById('editorModal');
            modal.style.display = 'flex';
            openEditor(this);
        });
    });
    document.getElementById('editorModal').addEventListener('click', function (e) {
        const editorBox = document.getElementById('editorBox');
        if (!editorBox.contains(e.target)) {
            closeEditor(true);
        }
    });
        function updateFemaNumber(femano, rev) {
            let cleaned = femano.replace(/_R\d+$/, ""); // remove _R followed by digits at the end
            return cleaned + "_R" + rev;
        }
        document.getElementById("SaveBtn").addEventListener("click", function () {
            const docId = document.getElementById("docId").value.trim();
            const revision = document.getElementById("revision").value.trim();
            const saveDate = document.getElementById("saveDate").value;
            const prepareview = document.getElementById("previewer").value.trim();
            const approve = document.getElementById("approver").value.trim();
            const prepare = document.getElementById("preparer").value;
            const data = [];
        console.log('inside work')
            docIdNew=updateFemaNumber(docId, revision);
            const rows = document.querySelectorAll("table tbody tr");
            rows.forEach(row => {
                const rowData = {};
                const cells = row.querySelectorAll("td");
                const inputTypes = Array.from(cells).map(cell => {
                if (cell.querySelector("div.cell-editable")) return "editable";
                return "text";
                });
                let index = 0;
                    rowData["input"] = cells[0].innerText.trim();
                    rowData["resources"] = cells[1].innerText.trim();
                    rowData["risk"] = cells[2].innerText.trim();
                    rowData["content"] = cells[3].innerText.trim();
                    rowData["personnel"] = cells[4].innerText.trim();
                    rowData["oppurtunities"] = cells[5].innerText.trim();
                    rowData["process"] = cells[6].innerText.trim();
                    rowData["kpi"] = cells[7].innerText.trim();
                    rowData["output"] = cells[8].innerText.trim();
                    data.push(rowData);
            });

            rowDataHeader={
                docId :docIdNew,
                revision:revision,
                saveDate:saveDate,
                previewer:prepareview,
                approver:approve,
                preparer:prepare,
                type:"TURTLE"
            }
            console.log("running")
            console.log(docIdNew)
            console.log(docId)
            data.push(rowDataHeader);
            if (docIdNew == docId) {
                    alert("The Revision number needs to be changed");
                    return;
                }
            const payload = JSON.stringify({ TurtleDetails : data });
                document.getElementById("loadingOverlay").style.display = "flex";

                // Prepare the XHR request
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "/AuditReport/control/createTurtleDoc", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                setTimeout
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                    document.getElementById("loadingOverlay").style.display = "none";
                    document.getElementById("SaveBtn").style.display="none";
                    document.getElementById("turtleBtn").style.display="block";
                    document.getElementById("turtleNewBtn").href=`TurtleReport?printdoc=done&docId=${docIdNew}`
                    if (xhr.status === 200) {
                    
                        console.log("Success:", xhr.responseText);
                        alert("Data Stored successfully.");
                    } else {
                        console.error("Error:", xhr.status, xhr.statusText);
                        alert("Failed to submit data.");
                    }
                    }
                };
            
                // Send the request
                xhr.send(payload);
        });
    })