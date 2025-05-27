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

function showHideUserPref() {
    var userPref = document.getElementById("user-details");

    if(userPref.style.display == "none") {
        userPref.style.display = "block";
    }
    else {
        userPref.style.display = "none";
    }
}

function selectOrgaOK(orgaName){
    var selectOrga = document.getElementById("orga"+orgaName);
    var currentModal = document.getElementById("selectOrga");
    selectOrga.click();
    currentModal.style.visibility = "hidden";
}
console.log("Script loaded");
const testerChecker = document.getElementById("tester");
const chatBox = document.getElementById("chat-box");
const userInput = document.getElementById("user-input");
const sendBtn = document.getElementById("send-btn");
const closeBtn=document.getElementById("close-btn");
const chatholder=document.getElementById("chat-holder");
const botImg = document.getElementById("bot-img");
const API_KEY = "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";
if(testerChecker){
    botImg.classList.add("hide");
}
else{
    botImg.classList.remove("hide");
}
async function fetchChatGPTResponse(message) {
  const apiUrl = "https://api.groq.com/openai/v1/chat/completions";

  try {
    const response = await fetch(apiUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${API_KEY}`,
      },
      body: JSON.stringify({
        messages: [{ role: "user", content: message }],
        model: "llama3-8b-8192",
        temperature: 1,
        max_tokens: 500,
        top_p: 1,
        stream: false,
      }),
    });

    if (!response.ok) {
      throw new Error(`API Error: ${response.status} ${response.statusText}`);
    }

    const data = await response.json();

    if (!data.choices || !data.choices.length) {
      throw new Error("Invalid response structure from API");
    }

    return data.choices[0].message.content;
  } catch (error) {
    console.error("Error in fetchChatGPTResponse:", error.message);
    throw new Error("Failed to get a response from the bot.");
  }
}

function addMessageToChat(role, text) {
  const messageElement = document.createElement("div");
  messageElement.classList.add("message", role);
  messageElement.textContent = text;
  chatBox.appendChild(messageElement);
  chatBox.scrollTop = chatBox.scrollHeight;
}

function truncateResponse(response, maxLength) {
	if (response.length > maxLength) {
	  return response.substring(0, maxLength) + "...";
	}
	return response;
  }


sendBtn.addEventListener("click", async () => {
  const userMessage = userInput.value.trim();
  const usermessageResized =`Craft a detailed and professional response to a query in the manufacturing domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field.Question : ${userMessage}. Answer: .give complete sentence max 500 characters`;
  console.log("User message:", usermessageResized);
  if (!userMessage) return;
  
  // Add user message to chat
  addMessageToChat("user", userMessage);
  userInput.value = "";

  // Add placeholder bot message
  const botPlaceholder = document.createElement("div");
  botPlaceholder.classList.add("message", "bot");
  botPlaceholder.textContent = "Thinking...";
  chatBox.appendChild(botPlaceholder);

  try {
    const botResponse = await fetchChatGPTResponse(usermessageResized);
	const truncatedResponse = truncateResponse(botResponse, 800); 
	botPlaceholder.textContent = truncatedResponse; // Update bot's message
  } catch (error) {
    botPlaceholder.textContent = "Error fetching response!";
  } finally {
    chatBox.scrollTop = chatBox.scrollHeight; // Ensure scroll stays at the bottom
  }
});
addMessageToChat("bot", "Welcome! I can help you with your 8D defect analysis. To get started, please tell me the defect description. ")
botImg.addEventListener("click",()=>{
  chatholder.classList.add("show");
  botImg.classList.add("hide");
  console.log("chat button clicked");
});
closeBtn.addEventListener("click",()=>{
  chatholder.classList.remove("show");
  botImg.classList.remove("hide");
  console.log("close button clicked");
});


