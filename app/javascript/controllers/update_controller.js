import { Controller } from "@hotwired/stimulus";
import { subscribe_to_updates } from "../channels/custom";

export default class extends Controller {
  static values = {
    channelId: String,
  };
  connect() {
    fetch("http://localhost:3000/channel-id").then((response) => {
      response.json().then((data) => {
        console.log(data);
        subscribe_to_updates(data.id);
      });
    });
  }
}
