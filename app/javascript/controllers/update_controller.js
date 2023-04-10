import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="update"
export default class extends Controller {
  static values = {
    channelId: String,
  };
  connect() {
    const chId = this.channelIdValue;
    const updateSocket = new WebSocket("ws://localhost:4000/cable");
    updateSocket.onopen = function (event) {
      console.log("Connected to update channel");
      updateSocket.send(
        JSON.stringify({
          command: "subscribe",
          identifier: JSON.stringify({
            id: "update-content-by user-request",
            channel: "UpdateChannel",
          }),
        })
      );
    };
    updateSocket.onmessage = function (event) {
      const data = JSON.parse(event.data).message;
      if (data?.id && data.id == chId) {
        console.log("Message from update channel", data);
      }
    };

    console.log("Hello from update controller!`", this.channelIdValue);
  }
}
