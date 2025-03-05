/*.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
*/
document.addEventListener("DOMContentLoaded", () => {
console.log("Script loaded from chatbot");
const chatBoxAi = document.getElementById("chat-box-area");
const userInputRes = document.getElementById("user-input-area");
const sendBtnUser = document.getElementById("send-btn-user");
const API_KEY_New = "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";
const button_input=document.querySelectorAll('button');
const chatform=document.getElementById("chat-form");
var button_num=0;
async function fetchChatResponse(message) {
  const apiUrl = "https://api.groq.com/openai/v1/chat/completions";

  try {
    const response = await fetch(apiUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${API_KEY_New}`,
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
console.log(button_input);
button_input.forEach(button_inputs => {
  button_inputs.addEventListener('click', () => {
    button_num = button_inputs.dataset.id; // Get the data-id of the button
    console.log(button_num);
  });
});
console.log(button_num);
function addMessageToChatRes(role, text) {
  const messageElement = document.createElement("div");
  messageElement.classList.add("chat-message-area", role);
  messageElement.textContent = text;
  chatBoxAi.appendChild(messageElement);
  chatBoxAi.scrollTop = chatBoxAi.scrollHeight;
}




sendBtnUser.addEventListener("click", async () => {
  const userMessage = userInputRes.value.trim();
  const manufacturing =`Craft a detailed and professional response to a query in the manufacturing domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const Production= `Craft a detailed and professional response to a query in the Production domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const Invetory= `Craft a detailed and professional response to a query in the Inventory domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const usermessageResized=button_num==1?manufacturing:button_num==2?Production:button_num==3?Invetory:userMessage;
  
console.log("User message:", usermessageResized);
  if (!userMessage) return;
  
  // Add user message to chat
  addMessageToChatRes("user-res", userMessage);
  userInputRes.value = "";

  // Add placeholder bot message
  const botPlaceholder = document.createElement("textarea");
  botPlaceholder.classList.add("chat-message-area", "bot-res");
  botPlaceholder.textContent = "Thinking...";
 
  chatBoxAi.appendChild(botPlaceholder);


  try {
    const botResponse = await fetchChatResponse(usermessageResized);
    console.log("Bot response:", botResponse);
	  botPlaceholder.textContent = botResponse;
    botPlaceholder.style.height = "auto";
    botPlaceholder.style.height = botPlaceholder.scrollHeight + "px"; // Update bot's message
    botPlaceholder.style.lineHeight="2rem";
  } catch (error) {
    botPlaceholder.textContent = "Error fetching response!";
  } finally {
    chatBoxAi.scrollTop = chatBoxAi.scrollHeight; // Ensure scroll stays at the bottom
  }

});

console.log('it is bot')
chatform.addEventListener("submit", async (e) => { 
    e.preventDefault(); });

});
