<#--
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
-->
<div class="main-container" id="tester">
    <aside class="sidebar">
      <h2 class="sidebar-title">Discover</h2>
      <nav class="sidebar-nav">
        <button class="sidebar-button button" data-id="1">Manufacturing</button>
        <button class="sidebar-button button" data-id="2">Production</button>
        <button class="sidebar-button button"  data-id="3">Inventory</button>
        <button class="sidebar-button button"  data-id="4">Logistics</button>
      </nav>
    </aside>
    <div class="chat-container">
      <header class="chat-header">
        Chat with Pangu
        
      </header>
      <main class="chat-area" id="chat-box">
        <p class="chat-message bot greet">Hi, Welcome To Pangun Tech!</p>
        <p class="chat-message bot greet">I'm Pangu, your Support assistant.</p>
        <!-- Messages will be dynamically added here -->
      </main>
      
        <form id="chat-form" class="chat-input-area">
              <input id="user-input" placeholder="Type your message here..." type="text"/>
            <input type="submit" id="send-btn" value="Send"/>
        </form>
        
      
    </div>
  </div>
  <script>
	console.log("Script loaded");
const chatBox = document.getElementById("chat-box");
const userInput = document.getElementById("user-input");
const sendBtn = document.getElementById("send-btn");
const closeBtn=document.getElementById("close-btn");
const chatholder=document.getElementById("chat-holder");
const botImg = document.getElementById("bot-img");
const API_KEY = "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";
const button_input=document.querySelectorAll('button');
const chatform=document.getElementById("chat-form");
var button_num=0;
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
console.log(button_input);
button_input.forEach(button_inputs => {
  button_inputs.addEventListener('click', () => {
    button_num = button_inputs.dataset.id; // Get the data-id of the button
    console.log(button_num);
  });
});
console.log(button_num);
function addMessageToChat(role, text) {
  const messageElement = document.createElement("div");
  messageElement.classList.add("chat-message", role);
  messageElement.textContent = text;
  chatBox.appendChild(messageElement);
  chatBox.scrollTop = chatBox.scrollHeight;
}

chatform.addEventListener("submit", async (e) => { 
  e.preventDefault(); });


sendBtn.addEventListener("click", async () => {
  const userMessage = userInput.value.trim();
  const manufacturing =`Craft a detailed and professional response to a query in the manufacturing domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const Production= `Craft a detailed and professional response to a query in the Production domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const Invetory= `Craft a detailed and professional response to a query in the Inventory domain. Use concise language to address technical, operational, or logistical aspects, ensuring the answer is tailored to the context provided. Include relevant examples, technical terms, or processes common in manufacturing, and suggest actionable solutions or improvements if applicable. Be precise, and focus on adding value by referencing best practices, standards, or innovations in the field. Question : ${userMessage}. Answer:must give complete sentence max 500 characters `;
  const usermessageResized=button_num==1?manufacturing:button_num==2?Production:button_num==3?Invetory:userMessage;
  
console.log("User message:", usermessageResized);
  if (!userMessage) return;
  
  // Add user message to chat
  addMessageToChat("user", userMessage);
  userInput.value = "";

  // Add placeholder bot message
  const botPlaceholder = document.createElement("div");
  botPlaceholder.classList.add("chat-message", "bot");
  botPlaceholder.textContent = "Thinking...";
  chatBox.appendChild(botPlaceholder);

  try {
    const botResponse = await fetchChatGPTResponse(usermessageResized);
    console.log("Bot response:", botResponse);
	  botPlaceholder.textContent = botResponse; // Update bot's message
  } catch (error) {
    botPlaceholder.textContent = "Error fetching response!";
  } finally {
    chatBox.scrollTop = chatBox.scrollHeight; // Ensure scroll stays at the bottom
  }
});
  </script>

  <style>
	.main-container {
	display: flex;
	width: 100%;
	height: 100%;
	background-color: #ffffff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.8);
	border-radius: 8px;
	overflow: hidden;
  }
  
  .sidebar {
	width: 15%;
	background-color: #2c3e50;
	color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
  }
  
  .sidebar-title {
	font-size: 1.5rem;
	margin-bottom: 20px;
  }
  
  .sidebar-nav {
	display: flex;
	flex-direction: column;
	gap: 15px;
  }
  
  .sidebar-button {
	width: 100%;
	padding: 10px 15px;
	background-color: #34495e;
	color: white;
	border: none;
	font-size: 1rem;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
  }
  
  .sidebar-button:hover {
	background-color: #1abc9c;
  }
  
  .chat-container {
	width: 85%;
	display: flex;
	flex-direction: column;
	background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('./pangu.webp?v=1') no-repeat center center;
	background-size: cover;
  }
  
  .chat-header {
	background-color: #0078d4;
	color: #ffffff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	font-size: 1.2rem;
  }
  
  .close-button {
	background-color: transparent;
	color: white;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
  }
  
  .chat-area {
	flex: 1;
	padding: 15px;
	overflow-y: auto;
	background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('/panguAi/images/pangu.webp?v=1') no-repeat center center;
  }
  
  .chat-message {
	
	margin-bottom: 10px;
	padding: 10px 15px;
	border-radius: 12px;
	font-size: 0.9rem;
  }
  
  .chat-message.user {
	background-color: #0078d4;
	color: white;
	line-height: 1.5;
	align-self: flex-end;
  }
  
  .chat-message.bot {
	background-color: #e0e0e0;
	color: #333;
	align-self: flex-start;
	line-height: 1.5;
  }
  
  .chat-input-area {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 15px;
	background-color: #ffffff;
	border-top: 1px solid #e0e0e0;
  }
  
  .chat-input-area input[type='text'] {
	flex: 1;
	resize: none;
	padding: 10px;
	font-size: 1rem;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 4px;
	height: 20px;
	outline: none;
  }
  
  .chat-input-area input[type='submit'] {
	background-color: #0078d4;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
  }
  
  .chat-input-area button:hover {
	background-color: #005bb5;
  }
  
  .bot-image {
	position: absolute;
	top: 20px;
	left: 20px;
	width: 100px;
	height: auto;
  }
  .color{
	background-color: #1abc9c
  }
  </style>