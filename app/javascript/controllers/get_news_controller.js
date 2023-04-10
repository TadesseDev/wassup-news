import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["n"];
  connect() {
    console.log("Hello, Stimulus!");
    const newsSocket = new WebSocket("ws://localhost:4000/cable");
    newsSocket.onopen = function (event) {
      console.log("Connected to news channel");
      newsSocket.send(
        JSON.stringify({
          command: "subscribe",
          identifier: JSON.stringify({
            id: "Load initial news",
            channel: "NewsChannel",
          }),
        })
      );
    };
    newsSocket.onmessage = function (event) {
      const response = JSON.parse(event.data);
      const resultReady = response.message?.["all-done"] ?? false;
      if (resultReady) {
        const data = response.message;
        console.log(data);
        newsSocket.close();
      }
    };
    newsSocket.onerror = function (event) {};
    newsSocket.onclose = function (event) {};
  }
}
