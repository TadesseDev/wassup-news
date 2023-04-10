export const render_category = (data) => {
  const category = Object.keys(data);
  const articles = Object.values(data)[0].articles;
  const CategoryDOM = document.getElementById(category);
  const articlesDOM = document.createElement("div");
  articlesDOM.classList.add("articles");
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
    articleDOM.style.backgroundImage = `url(${article.urlToImage})`;
    articleDOM.appendChild(container);
    articlesDOM.appendChild(articleDOM);
  });
  CategoryDOM.appendChild(articlesDOM);
};
