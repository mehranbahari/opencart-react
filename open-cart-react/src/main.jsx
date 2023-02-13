import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import "./App.css";
import { ContextProvide } from "./context/Context";

ReactDOM.createRoot(document.getElementById("root")).render(
  <ContextProvide>
    <React.StrictMode>
      <App />
    </React.StrictMode>
  </ContextProvide>
);
