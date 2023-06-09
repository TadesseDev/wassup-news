export const render_category = (data, update = false) => {
  const category = Object.keys(data);
  const articles = Object.values(data)[0].articles;
  const CategoryDOM = document.getElementById(category);
  const articlesDOM = document.createElement("div");
  const page = CategoryDOM.getElementsByClassName("page")[0];

  if (!update) {
    Array.from(CategoryDOM.getElementsByClassName("articles")).forEach((ele) =>
      ele.remove()
    );
    if (category != "general") page.value = 1;
  }
  articlesDOM.classList.add("articles");
  if (!articles || articles?.length < 1) {
    const div = document.createElement("div");
    div.classList.add("articles");
    div.classList.add("error");
    div.innerHTML = articles
      ? `<h4> No news found </h4> <p> Please update your filters`
      : `<h4>Fail to retrieve data</h4><p> Its most likely the server runs out of API limit, Please communicate the admin to reset the API key</p>`;
    CategoryDOM.appendChild(div);
    return;
  }

  articles.forEach((article) => {
    const articleDOM = document.createElement("article");
    const container = document.createElement("div");
    articleDOM.classList.add("news");
    container.classList.add("container");
    container.innerHTML = `
              <h3 class="title" >
    ${article.title}
</h3>
<div class="bottom">
<div class="about">
         <h4 class="by"><span class="green">By : </span>${article.author}</h4>
<h4 class="by"><span class="green"> On: </span>${article.source.name}</h4>
</div>
<p class="published-at">${article.publishedAt.split("T").join(" at ")}</p>
</div>
<div class="overlay">
    <div class="mirror"></div>
    <div class="content">

<p class="published-at">${article.description}</p>
<a href="${article.url}" target="blanck">Read Full Article</a>
    </div>
</div>`;
    articleDOM.style.backgroundImage = `url(${
      article.urlToImage ||
      "https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg"
    })`;
    articleDOM.appendChild(container);
    articlesDOM.appendChild(articleDOM);
  });
  CategoryDOM.appendChild(articlesDOM);
  if (category != "general") page.value = parseInt(page.value) + 1;
};

export const render_search_result = (data) => {
  const articles = Object.values(data)[0].articles;

  const searchResultDOM = document.getElementById("search-results");
  const articlesDOM = searchResultDOM.getElementsByClassName("articles")[0];
  searchResultDOM.style.display = "block";
  articlesDOM.innerHTML = ``;
  if (articles.length > 0) {
    articles.forEach((article) => {
      const articleDOM = document.createElement("article");
      const container = document.createElement("div");
      articleDOM.classList.add("news");
      container.classList.add("container");
      container.innerHTML = `
              <h3 class="title" >
    ${article.title}
</h3>
<div class="bottom">
<div class="about">
         <h4 class="by"><span class="green">By : </span>${article.author}</h4>
<h4 class="by"><span class="green"> On: </span>${article.source.name}</h4>
</div>
<p class="published-at">${article.publishedAt.split("T").join(" at ")}</p>
</div>
<div class="overlay">
    <div class="mirror"></div>
    <div class="content">

<p class="published-at">${article.description}</p>
<a href="${article.url}" target="blanck">Read Full Article</a>
    </div>
</div>`;
      articleDOM.style.backgroundImage = `url(${
        article.urlToImage ||
        "https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg"
      })`;
      articleDOM.appendChild(container);
      articlesDOM.appendChild(articleDOM);
    });
  } else {
    const div = document.createElement("div");
    div.textContent = "No news found";
    articlesDOM.appendChild(div);
  }
};

export const subscribe_to_initial_news = (chanelId) => {
  const newsSocket = new WebSocket("ws://localhost:3000/cable");
  newsSocket.onopen = function (event) {
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
      // TODO: Let the user know that the data are here.
    } else if (data && streamingId == chanelId) {
      render_category(data);
      // data is ready to be rendered
    }
  };
  newsSocket.onerror = function (event) {};
  newsSocket.onclose = function (event) {};
};

export const subscribe_to_updates = (chanelId) => {
  const updateSocket = new WebSocket("ws://localhost:3000/cable");
  updateSocket.onopen = function (event) {
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
    const response = JSON.parse(event.data);
    const data = response.message?.data;
    const streamingId = response.message?.id;
    if (data && streamingId == chanelId) {
      const search = data.search;
      delete data.search;
      if (search) render_search_result(data);
      else render_category(data, true);
    }
  };
};
