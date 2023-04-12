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
        fetch("http://localhost:4000/subscribe-to-news-stream").catch((err) => {
          console.log(err);
          // TODO: let the user know they are not subscribed
        });
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
    const anchors = Array.from(container.getElementsByTagName("button"));

    const regex = new RegExp(`${country}`, "i");
    anchors.map((anchor) => {
      if (anchor.innerText.match(regex)) {
        anchor.style.display = "block";
      } else {
        anchor.style.display = "none";
      }
    });
  }

  removeParent(event) {
    event.target.closest(".parent").remove();
  }
  hideParent(event) {
    console.log(event.target.closest(".parent"));
    event.target.closest(".parent").style.display = "none";
  }

  showRegistrationForm() {
    document.getElementById("header-subscription-form").style.display = "flex";
    document.getElementsByTagName("header").style.height = "max-content";
  }
}
