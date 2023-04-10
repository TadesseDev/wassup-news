import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="update"
export default class extends Controller {
  static values = {
    url: String,
  };
  connect() {
    // const sessionId = document.cookie.get("_rails_session");
    // const sessionId = document.cookie
    //   .split("; ")
    //   .find((row) => row.startsWith("_rails_session"))
    //   .split("=")[1];
    console.log("Hello from update controller!`", this.urlValue);
  }
}
