import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="get-news"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!");
    const newsSocket = new WebSocket("ws://localhost:4000/cable");
    newsSocket.onopen = function (event) {
      console.log("Connected to news channel");
      newsSocket.send(
        JSON.stringify({
          command: "subscribe",
          identifier: JSON.stringify({
            channel: "NewsChannel",
          }),
        })
      );
    };
    newsSocket.onmessage = function (event) {
      console.log("Received data from news channel", event.data);
      // newsSocket.close();
    };
    newsSocket.onerror = function (event) {};
    newsSocket.onclose = function (event) {};
  }
}
