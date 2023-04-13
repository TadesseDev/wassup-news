# Wassup-News

Our website collects news from over 80,000 blogs and news channels from around the world and presents them in a single location. Users can easily stay up-to-date with the latest news by subscribing to daily, weekly, or monthly updates, or by visiting the website and browsing the top news from different categories such as sports, business, technology, and more. The website also allows users to filter the news by country or keyword. With this platform, we aim to make it easy for people to stay informed on current events and news from all around the world.

## Table of Contents

* [Is it for you?](#getting-started)
* [Feature previw](#getting-started)
* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)

## Is it for you?
Wassup-News is a website that is designed for anyone who wants to stay up to date on current events from around the world. Whether you're interested in news related to sports, business, technology, or any other topic, Wassup-News provides a simple and efficient way to access the latest news from a wide range of sources.

This project is ideal for people who:

- Want to keep up to date on news from multiple sources without having to visit each site individually
- Prefer to receive news updates on a regular basis, such as daily, weekly, or monthly
- Are interested in news from specific categories, such as sports, business, or technology
- Want to filter news by country or search for specific keywords
- Are looking for a user-friendly news platform that is easy to navigate and use

Whether you're a casual news reader or a journalist who needs to stay on top of the latest news for your work, Wassup-News is a valuable resource that can help you stay informed and up to date.
## Feature previw
[Screencast from 14-04-2023 12:02:20 ጡዋት.webm](https://user-images.githubusercontent.com/69077061/231882688-7e860597-90f9-49b3-9a4f-99219ab8f7d8.webm)

## Getting Started

Getting Started
To get started with our Rails app, follow these steps:

### Prerequisites
- [ ] Ruby 3.1.2
- [ ] Rails 7.0.4
- [ ] PostgreSQL 14.7
- [ ] Redis 7.0
- [ ] Sidekiq gem
- [ ] API key from [newsapi](https://newsapi.org/)
### Installation
1. Clone the repository from GitHub:

```bash
git clone https://github.com/TadesseDev/wassup-news.git
```
2. Navigate into the project directory:
```bash
cd wassup-news
```
3. Install the required dependencies:
```bash
bundle install
```
4. Set up the database:
```bash
rails db:setup
```
5. Start the Sidekiq server:
```bash
bundle exec sidekiq
```
6. Set up your API key by creating a `.env` file in the root directory of the project and adding the following line:
```css
NEWS_API_KEY=[your_api_key_here]
```
Start the Rails server:
``` bash
rails s
```
> Please make sure to do `db:setup` or `db:create, db:migrate, db:seed` exaclty once. Doing the seed file more than once causes mre than once copy of country and categories.
### Using Docker
If you prefer to use Docker, you can use the public Docker image we have published on Docker Hub. To get started with the Docker image, follow these steps:

1. Pull the Docker image:
```bash
docker pull tadessealemayehu/wassup-news
```
2. Create a `.env` file in the root directory of the project and add the following line with your API key:
```css
NEWS_API_KEY=[your_api_key_here]
```
3. Start the container:
```bash
docker run -it --env-file .env -p 3000:3000 tadessealemayehu/wassup-news
```
> Please keep inmind this only going to publish the container for the base image. You need to run `docker compose up` comnad inside the root directory on the project to get all the service running.
```bash
docker compose up
```
##### Once you've completed the above steps, you should be able to access the website by navigating to http://localhost:3000 in your web browser.

### Prerequisites

- [ ] Ruby 3.1.2
- [ ] Rails 7.0.4
- [ ] PostgreSQL 14.7
- [ ] Redis 7.0
- [ ] Sidekiq gem
- [ ] API key from [newsapi](https://newsapi.org/)

### Installation

To install Wassup-News on your local machine, follow these steps:

- Clone the repository from GitHub: git clone https://github.com/TadesseDev/wassup-news.git
- Install the required dependencies: bundle install
- Create and setup the database: rake db:create db:migrate db:seed
- Start the Redis server: redis-server
- Start the Sidekiq worker: bundle exec sidekiq
- Start the Rails server: rails server

## Usage

To use Wassup-News, you can either subscribe to receive daily, weekly, or monthly news updates or visit the website directly. 

Once you are on the website, you can use the following features:

- **Search**: Use the search bar to search for specific keywords, topics, or news sources.

- **Filter by category**: Use the category filter to view news stories based on the category you're interested in. Categories include sports, business, technology, and more.

- **Filter by country**: Use the country filter to view news stories from specific countries or regions.

- **Subscribe**: If you'd like to receive regular news updates via email, simply enter your email address and choose your preferred update frequency (daily, weekly, or monthly).

- **Read more**: Click on any news story to read the full article on the original source website.

Please note that as of now, the application is not deployed online, so you will need to run it locally on your machine to access the website. Once the application is deployed, you will be able to access it online and use its features from anywhere.
## Future Features

Wassup-News is an ongoing project and we are always looking for ways to improve it. Here are some of the features we plan to add in the future:

- **Deploy to AWS**: We plan to deploy Wassup-News on Amazon Web Services (AWS) to increase the website's reliability and scalability.
- **Enhanced Filtering**: We plan to improve the filtering functionality by adding more options for filtering news, such as by language, date, and popularity.
- **Social Media Integration**: We plan to integrate Wassup-News with social media platforms so that users can share articles they like on their favorite social media channels.

We are open to suggestions for other features that you would like to see added to Wassup-News. If you have any ideas, please feel free to submit an issue or pull request on our GitHub repository!



## Contributing

We welcome contributions to Wassup-News from anyone who is interested in improving the project. Here are some ways you can contribute:

- **Reporting issues:** If you encounter a bug or have an issue with the application, please let us know by opening an issue on the [GitHub repository](https://github.com/TadesseDev/wassup-news/issues). Please include as much detail as possible to help us identify and resolve the issue.
- **Suggesting features:** If you have an idea for a new feature or improvement, please open an issue on the [GitHub repository](https://github.com/TadesseDev/wassup-news/issues) and describe your suggestion in detail.
- **Submitting pull requests:** If you'd like to contribute code to Wassup-News, please submit a pull request on the [GitHub repository](https://github.com/TadesseDev/wassup-news/pulls). Please make sure your code is well-documented and follows the project's coding style guidelines.
- **Testing:** You can also contribute by testing the application and reporting any issues or bugs you encounter.

Before contributing, please make sure to read our [Code of Conduct](https://github.com/TadesseDev/wassup-news/blob/main/CODE_OF_CONDUCT.md) to ensure that your contributions align with our community standards. Thank you for your interest in contributing to Wassup-News!



## License

Wassup-News is licensed under the [MIT License](https://opensource.org/licenses/MIT). 

You can find a copy of the license in the [LICENSE](./LICENSE)  file. 

Please note that this license only applies to the Wassup-News source code and does not cover any of the news content obtained from external sources.


## Acknowledgments

We'd like to thank the following individuals and projects for their contributions to Wassup-News:


- [Sidekiq](https://sidekiq.org/) for their powerful background processing framework that is used in Wassup-News.
- [Redis](https://redis.io/) for their in-memory data structure store that is used as a database and cache in Wassup-News.
- [PostgreSQL](https://www.postgresql.org/) for their open source relational database management system that is used as the main database for Wassup-News.
- [Ruby on Rails](https://rubyonrails.org/) for their web application framework that is used to build Wassup-News.
- [Font Awesome](https://fontawesome.com/) for their icon toolkit that is used in Wassup-News.

We also want to express our gratitude to all the contributors who have helped make this project better by submitting bug reports, feature suggestions, and pull requests. Thank you all for your support!

