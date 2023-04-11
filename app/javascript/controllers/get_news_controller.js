import { Controller } from "@hotwired/stimulus";
import { subscribe_to_initial_news } from "../channels/custom";
export default class extends Controller {
  static values = {
    channelId: String,
  };
  connect() {
    fetch("http://localhost:4000/channel-id").then((response) => {
      response.json().then((data) => {
        console.log(data);
        subscribe_to_initial_news(data.id);
      });
    });
  }
}
