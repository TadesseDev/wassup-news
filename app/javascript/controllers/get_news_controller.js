import { Controller } from "@hotwired/stimulus";
import { render_category } from "../channels/custom";
export default class extends Controller {
  static values = {
    channelId: String,
  };
  connect() {
    const chanelId = this.channelIdValue;
    // If new user? set session/chanel _id before further processing
    if (!chanelId) window.location.reload();
    console.log("Hello, Stimulus!", chanelId);
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
      const data = response.message?.data;
      const streamingId = response.message?.id;
      const completed = response.message?.["data"]?.["all-don"] ?? false;
      if (completed) {
        console.log("closing socket");
        newsSocket.close();
      } else if (data && streamingId == chanelId) {
        // console.log(data);
        render_category(data);
        // data is ready to be rendered
      }
    };
    newsSocket.onerror = function (event) {};
    newsSocket.onclose = function (event) {};

    // const data = {
    //   general: {
    //     status: "ok",
    //     totalResults: 35,
    //     articles: [
    //       {
    //         source: {
    //           id: null,
    //           name: "Yahoo Entertainment",
    //         },
    //         author: "Ryan Young",
    //         title:
    //           "Masters 2023 live: Follow Brooks Koepka, Jon Rahm and others as they battle for the green jacket - Yahoo Sports",
    //         description: "The final round of the Masters is underway.",
    //         url: "https://sports.yahoo.com/masters-2023-live-follow-brooks-koepka-jon-rahm-and-others-as-they-battle-for-the-green-jacket-110042679.html",
    //         urlToImage:
    //           "https://s.yimg.com/ny/api/res/1.2/n47WshrwZ4Q8wEYd.A8ViA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2023-03/1dd31de0-d6f5-11ed-bdff-8bf5c17e3329",
    //         publishedAt: "2023-04-09T20:29:35Z",
    //         content:
    //           "Jon Rahm (left) and Brooks Koepka are going head-to-head in the final round of the 2023 Masters. Will one of them walk away with the green jacket? (Photo by Andrew Redington/Getty Images)\r\nThe final … [+472 chars]",
    //       },
    //       {
    //         source: {
    //           id: "usa-today",
    //           name: "USA Today",
    //         },
    //         author: "USA TODAY",
    //         title:
    //           "AOC calls on Biden to ignore Texas abortion pill ruling - USA TODAY",
    //         description: null,
    //         url: "https://www.usatoday.com/story/news/politics/2023/04/09/aoc-abortion-pill-biden-texas-ruling/11631563002/",
    //         urlToImage: null,
    //         publishedAt: "2023-04-09T19:31:49Z",
    //         content: null,
    //       },
    //       {
    //         source: {
    //           id: null,
    //           name: "New York Post",
    //         },
    //         author: "Carl Campanile",
    //         title:
    //           "Bragg case against Trump is 'abuse of power,' gift to Dems: Ex-AG Bill Barr - New York Post ",
    //         description:
    //           "Former US Attorney General Barr slammed Manhattan DA’s Alvin Bragg’s hush money criminal case against Trump as prosecutorial abuse and a partisan hit job that strengthens the Democrats&…",
    //         url: "https://nypost.com/2023/04/09/ex-ag-bill-barr-bragg-case-against-trump-is-abuse-of-power-gift-to-dems/",
    //         urlToImage:
    //           "https://nypost.com/wp-content/uploads/sites/2/2023/04/NYPICHPDPICT000009420118.jpg?quality=75&strip=all&w=1024",
    //         publishedAt: "2023-04-09T19:03:00Z",
    //         content:
    //           "Former Attorney General Bill Barr on Sunday slammed Manhattan District Attorney Alvin Bragg’s criminal case against ex-President Donald Trump as prosecutorial abuse and a partisan hit job that only s… [+3938 chars]",
    //       },
    //       {
    //         source: {
    //           id: "cnn",
    //           name: "CNN",
    //         },
    //         author: "Chloe Melas, Alli Rosenbloom",
    //         title: "Taylor Swift and Joe Alwyn break up after six years - CNN",
    //         description:
    //           "Taylor Swift and actor Joe Alwyn have broken up after six years together.",
    //         url: "https://www.cnn.com/2023/04/09/entertainment/taylor-swift-joe-alwyn-break-up/index.html",
    //         urlToImage:
    //           "https://media.cnn.com/api/v1/images/stellar/prod/230408204518-taylor-swift-joe-alwyn-split-restricted.jpg?c=16x9&q=w_800,c_fill",
    //         publishedAt: "2023-04-09T18:05:00Z",
    //         content:
    //           "Taylor Swift and actor Joe Alwyn have broken up after six years together.\r\nA source close to Taylor confirmed the news to CNN saying Taylor and Joe broke up a few weeks ago. They simply grew apart an… [+1980 chars]",
    //       },
    //       {
    //         source: {
    //           id: "usa-today",
    //           name: "USA Today",
    //         },
    //         author: "Jordan Mendoza",
    //         title:
    //           "Puppy 'miraculously' uninjured after being thrown out of vehicle during LA police chase - USA TODAY",
    //         description:
    //           "The Los Angeles Police Department said a puppy was not injured after it was thrown out of a vehicle during a two-hour police chase.",
    //         url: "https://www.usatoday.com/story/news/nation/2023/04/09/puppy-thrown-out-of-vehicle-la-police-chase/11631739002/",
    //         urlToImage:
    //           "https://www.gannett-cdn.com/presto/2023/04/09/USAT/dfdba9b6-ccd7-44db-b0d7-13d5993921fd-lapd_chase_dog.jpg?crop=930,524,x0,y160&width=930&height=524&format=pjpg&auto=webp",
    //         publishedAt: "2023-04-09T17:54:58Z",
    //         content:
    //           'A puppy "miraculously" survived without a scratch after it was thrown out of a moving vehicle during a police chase in Los Angeles last week, police said.\r\nOn Friday, Los Angeles police officers enga… [+1769 chars]',
    //       },
    //       {
    //         source: {
    //           id: "marca",
    //           name: "Marca",
    //         },
    //         author: "LW",
    //         title:
    //           "Drake broke his betting curse and wins 2.7 million on Israel Adesanya vs. Alex Pereira fight at UFC 287 - Marca English",
    //         description:
    //           "It is known in the world of sports and betting that Drake likes to gamble his money. This time he made several strong bets on the UFC 287 bill and took a good bag in his wallet.",
    //         url: "https://www.marca.com/en/lifestyle/celebrities/2023/04/09/6432f12ce2704e3e528b45a2.html",
    //         urlToImage:
    //           "https://phantom-marca.unidadeditorial.es/9c57513dfe80e0eff780a487cd6984f6/resize/1200/f/jpg/assets/multimedia/imagenes/2023/04/09/16810597023480.jpg",
    //         publishedAt: "2023-04-09T17:09:24Z",
    //         content:
    //           "It is known in the world of sports and betting that Drake likes to gamble his money. This time he made several strong bets on the UFC 287 bill and took a good bag in his wallet. \r\nIn the social netwo… [+1153 chars]",
    //       },
    //     ],
    //   },
    // };
  }
}
