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
    console.log("reset button is", this.resetSearchTarget);
  }

  reseatSearch(event) {
    // reset the search container
    // TODO: Implement functionality
    // event.target.parentElement.getElementsByClassName("articles")[0].innerHTML =
    "";
    // event.target.parentElement.style.display = "none";
    const searchContainer = event.target.closest("#search-results");
    searchContainer.getElementsByClassName("articles")[0].innerHTML = "";
    searchContainer.style.display = "none";
    console.log(
      "Implement me in the get_news_controller.js",
      event.target.closest("#search-results")
    );
  }

  filterCountry(event) {
    const country = event.target.value;
    const container =
      event.target.parentElement.getElementsByClassName("container")[0];
    console.log(container);
    const anchors = Array.from(container.getElementsByTagName("a"));

    const regex = new RegExp(`${country}`, "i");
    anchors
      .filter((anchor) => !anchor.textContent.match(regex))
      .forEach((anchor) => (anchor.style.display = "none"));
    anchors
      .filter((anchor) => anchor.textContent.match(regex))
      .forEach((anchor) => (anchor.style.display = "block"));
  }
}
