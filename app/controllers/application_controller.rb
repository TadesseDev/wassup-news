class ApplicationController < ActionController::Base
  before_action :set_queries
  def set_queries
    @categories = Category.all
    @countries = Country.all
    @category = nil
    @country = nil
    @keyWord = nil
    @page = 1
    @pageSize = 10
    @channel_id=SecureRandom.uuid
    @news = {
      "top-news": {
        status: "ok",
        totalResults: 36,
        articles: [
          {
            source: {
              id: nil,
              name: "Fox Business"
            },
            author: "Timothy Nerozzi",
            title:
              "Twitter-Substack feud heats up as Elon Musk is accused of censorship - Fox Business",
            description:
              "Elon Musk is denying accusations of censorship after severely throttling content from Twitter competitor Substack, claiming the company is \"trying to download a massive portion of the Twitter database.\"",
            url:
              "https://www.foxbusiness.com/technology/twitter-substack-feud-heats-up-elon-musk-accused-censorship",
            urlToImage:
              "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2023/03/0/0/GettyImages-1247308246.jpg?ve=1&tl=1",
            publishedAt: "2023-04-08T17:47:18Z",
            content:
              "Elon Musk is denying accusations of censorship after he took aggressive measures to restrict the use of a competing platform on Twitter.\r\nTwitter throttled the sharing of links to semi-competitor Sub… [+3058 chars]"
          },
          {
            source: {
              id: nil,
              name: "Yahoo Entertainment"
            },
            author: "Lily Rose",
            title:
              "Blake Lively sports a black bathing suit on vacation with her family: 'She sells seashells down by the seashore' - Yahoo Life",
            description:
              "The celeb shared family photos from her tropical getaway.",
            url:
              "https://www.yahoo.com/lifestyle/blake-lively-family-vacation-photos-with-ryan-reynolds-170954862.html",
            urlToImage:
              "https://s.yimg.com/ny/api/res/1.2/6WoJvzr3nst8V3fWvME81Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2022-05/b7bad990-cab5-11ec-b5dd-5b28a1774511",
            publishedAt: "2023-04-08T17:09:54Z",
            content:
              "Blake Lively shares photos from her family vacation. (Photo: Theo Wargo/WireImage)\r\nBlake Lively has shared family photos from her latest tropical vacation. The actress posted a beachy Instagram caro… [+2761 chars]"
          },
          {
            source: {
              id: "fox-news",
              name: "Fox News"
            },
            author: "Julia Musto",
            title:
              "Webb Telescope uncovers new details in stunning image of supernova remnant - Fox News",
            description:
              "NASA's James Webb Space Telescope has revealed new details in a supernova remnant created by a massive exploding star 11,000 light-years away in the constellation Cassiopeia.",
            url:
              "https://www.foxnews.com/science/webb-telescope-new-details-stunning-image-supernova-remnant",
            urlToImage:
              "https://static.foxnews.com/foxnews.com/content/uploads/2023/04/fe9151b9-THUMB.jpg",
            publishedAt: "2023-04-08T16:32:00Z",
            content:
              "A new image from NASA's James Webb Space Telescope shows a supernova remnant created by a massive exploding star. \r\nThe mid-infrared image shows the supernova remnant Cassiopeia A which was created b… [+1936 chars]"
          },
          {
            source: {
              id: nil,
              name: "Eonline.com"
            },
            author: "Corinne Heller",
            title:
              "Jeremy Renner Enjoys Family Trip to Six Flags Amusement Park 3 Months After Snowplow Accident - E! NEWS",
            description:
              "Jeremy Renner is up and about as he continues his recovery after being run over by a snow plow on New Year's Day. See photos from his family trip to Six Flags Magic Mountain Amusement Park.",
            url:
              "https://www.eonline.com/news/1370818/jeremy-renner-enjoys-family-trip-to-six-flags-amusement-park-3-months-after-snowplow-accident",
            urlToImage:
              "https://akns-images.eonline.com/eol_images/Entire_Site/202338/rs_600x600-230408092449-600-jeremy-renner-family-six-flags-instagram-cjh-040723.jpg?fit=around%7C1080:1080&output-quality=90&crop=1080:1080;center,top",
            publishedAt: "2023-04-08T16:31:00Z",
            content:
              "Jeremy Renner is back on his feet, as seen on a family trip to Six Flags Magic Mountain, as he continues his recovery from a near-fatal snowplow accident.\r\nThe Marvel star shared two group photos fro… [+755 chars]"
          },
          {
            source: {
              id: nil,
              name: "Nintendo Life"
            },
            author: "Liam Doolan",
            title:
              "Mario Movie Continues To Smash Global Box Office Records In Opening Weekend - Nintendo Life",
            description: "Mario time!",
            url:
              "https://www.nintendolife.com/news/2023/04/mario-movie-continues-to-smash-global-box-office-records-in-opening-weekend",
            urlToImage:
              "https://images.nintendolife.com/0912a5138c93e/1280x720.jpg",
            publishedAt: "2023-04-08T16:30:00Z",
            content:
              "Subscribe to Nintendo Life on YouTube\r\nWe're still in the early days of The Super Mario Bros. Movie, and so far it appears to be smashing it at the box office. In an update, the film is now projected… [+1296 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Tierney Sneed",
            title:
              "Rival rulings on medication abortion hypercharge the post-Roe legal war - CNN",
            description:
              "A pair of conflicting federal court rulings on Friday created arguably the most contentious and chaotic legal flashpoint over abortion access since the Supreme Court's ruling last summer that overturned Roe v. Wade and ended the right to an abortion nationwid…",
            url:
              "https://www.cnn.com/2023/04/08/politics/medication-abortion-texas-washington-fda/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230407153625-medical-abortion-mifepristone-file.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T16:16:00Z",
            content:
              "A pair of conflicting federal court rulings on Friday created arguably the most contentious and chaotic legal flashpoint over abortion access since the Supreme Courts ruling last summer that overturn… [+9118 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Aimee Lewis",
            title: "Tiger Woods makes the cut at The Masters - CNN",
            description:
              "It remained in the balance for much of the morning as to whether Tiger Woods would make the cut at The Masters but after a nervy wait the five-time champion made it through to the third and fourth rounds in Augusta.",
            url:
              "https://www.cnn.com/2023/04/08/golf/tiger-woods-masters-cut-spt-intl/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230408100439-01-masters-040823.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T16:16:00Z",
            content:
              "It remained in the balance for much of the morning as to whether Tiger Woods would make the cut at The Masters but after a nervy wait the five-time champion made it through to the third and fourth ro… [+2110 chars]"
          },
          {
            source: {
              id: nil,
              name: "BBC News"
            },
            author: "https://www.facebook.com/bbcnews",
            title:
              "Thabo Bester: 'Facebook rapist' who faked death arrested in Tanzania - BBC",
            description:
              "Thabo Bester, known as the \"Facebook rapist\", was at large for a year after escaping South African prison.",
            url: "https://www.bbc.com/news/world-africa-65221385",
            urlToImage:
              "https://ichef.bbci.co.uk/news/1024/branded_news/1806B/production/_129311489_gettyimages-129143970.jpg",
            publishedAt: "2023-04-08T15:58:08Z",
            content:
              "A rapist and murderer who escaped a South African prison by faking his own death has been arrested in Tanzania.\r\nThabo Bester was at large for a year after it was thought he died by setting himself o… [+1719 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Michelle Watson, Zoe Sottile",
            title:
              "'We need your help': $10,000 reward offered for tips that lead to arrest of third suspect in Florida triple homicide - CNN",
            description:
              "Officials are offering a total of $10,000 for information that leads to the arrest of 16-year-old Tahj Brewton, the third suspect sought in connection with the recent shooting deaths of three Florida teenagers.",
            url:
              "https://www.cnn.com/2023/04/08/us/reward-florida-teens-triple-homicide/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230408110030-tahj-brewton-reward-florida-teens-triple-homicide.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T15:26:00Z",
            content:
              "Officials are offering a total of $10,000 for information that leads to the arrest of 16-year-old Tahj Brewton, the third suspect sought in connection with the recent shooting deaths of three Florida… [+1798 chars]"
          },
          {
            source: {
              id: nil,
              name: "KABC-TV"
            },
            author: nil,
            title:
              "McDonald's layoffs 2023: Hundreds to be laid off as burger giant restructures company, source says - KABC-TV",
            description:
              "\"There are more people that have been moved into new roles or promoted than have been laid off,\" the source said Friday.",
            url:
              "https://abc7.com/mcdonalds-layoffs-2023-mcdonalds-closing-offices-hq/13102804/",
            urlToImage:
              "https://cdn.abcotvs.com/dip/images/13077318_040323-wls-mcdonalds-layoffs-6avo-vid.jpg?w=1600",
            publishedAt: "2023-04-08T15:01:12Z",
            content:
              "NEW YORK -- Hundreds of people are being laid off from McDonald's as the burger giant restructures the company, a source familiar with the situation confirmed to ABC7 Friday.\r\nEarlier this week, the … [+1913 chars]"
          }
        ]
      },
      business: {
        status: "ok",
        totalResults: 69,
        articles: [
          {
            source: {
              id: nil,
              name: "Fox Business"
            },
            author: "Timothy Nerozzi",
            title:
              "Twitter-Substack feud heats up as Elon Musk is accused of censorship - Fox Business",
            description:
              "Elon Musk is denying accusations of censorship after severely throttling content from Twitter competitor Substack, claiming the company is \"trying to download a massive portion of the Twitter database.\"",
            url:
              "https://www.foxbusiness.com/technology/twitter-substack-feud-heats-up-elon-musk-accused-censorship",
            urlToImage:
              "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2023/03/0/0/GettyImages-1247308246.jpg?ve=1&tl=1",
            publishedAt: "2023-04-08T17:47:18Z",
            content:
              "Elon Musk is denying accusations of censorship after he took aggressive measures to restrict the use of a competing platform on Twitter.\r\nTwitter throttled the sharing of links to semi-competitor Sub… [+3058 chars]"
          },
          {
            source: {
              id: nil,
              name: "SFGate"
            },
            author: "Susana Guerrero",
            title:
              "Bay Area restaurant KC's BBQ permanently closes after 55 years - SFGATE",
            description:
              "The owner of the long-standing Berkeley restaurant cited financial issues as the reason for the closure.",
            url:
              "https://www.sfgate.com/food/article/bay-area-berkeley-restaurant-kcs-bbq-closure-17885261.php",
            urlToImage:
              "https://s.hdnux.com/photos/01/20/44/56/21121950/4/rawImage.jpg",
            publishedAt: "2023-04-08T17:03:33Z",
            content:
              "KCs BBQ, an enduring Berkeley fixture, has permanently closed its doors after five decades.The Kansas City-style barbecue restaurant closed Wednesday following a period of financial struggle, accordi… [+1856 chars]"
          },
          {
            source: {
              id: nil,
              name: "WPXI Pittsburgh"
            },
            author: "Natalie Miller",
            title:
              "Norfolk Southern train cars derail in Pittsburgh - WPXI Pittsburgh",
            description:
              "Norfolk Southern train cars have derailed in Pittsburgh.",
            url:
              "https://www.wpxi.com/news/local/norfolk-southern-train-derails-pittsburgh/QAKEEDO7XFG2BMSHVZPM5XWHII/",
            urlToImage:
              "https://cmg-cmg-tv-10080-prod.cdn.arcpublishing.com/resizer/TA0JsuuZwIz7F6zmh-FsO8kk50c=/1440x810/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/cmg/ECZVLY5DR5CYPEOMIAHLIMFVNQ.jpg",
            publishedAt: "2023-04-08T16:54:34Z",
            content:
              "PITTSBURGH — Norfolk Southern train cars have derailed in Pittsburgh.\r\nAccording to a company spokesperson, five empty steel cars derailed.\r\nA 911 dispatcher said police, fire and EMS were called to … [+804 chars]"
          },
          {
            source: {
              id: nil,
              name: "WFAA.com"
            },
            author: "WFAA Staff",
            title:
              "NorthPark Center threat was 'unsubstantiated' Dallas police say after mall evacuation - WFAA.com",
            description:
              "Dallas police said officers responded to the mall at approximately 10:30 a.m. Saturday for reports that the mall received an unconfirmed threat.",
            url:
              "https://www.wfaa.com/article/news/local/northpark-center-evacuated-bomb-threat/287-e6baaad1-3d91-43bd-9df6-9415e00e58e6",
            urlToImage:
              "https://media.wfaa.com/assets/WFAA/images/7d5bf595-d1ab-41fa-9b24-faa32d86905a/7d5bf595-d1ab-41fa-9b24-faa32d86905a_1140x641.png",
            publishedAt: "2023-04-08T16:48:00Z",
            content:
              "DALLAS The NorthPark Center along U.S. Hwy. 75 in northern Dallas was evacuated Saturday morning due to a potential threat, WFAA confirmed.\r\nDallas police said officers responded to the mall at appro… [+742 chars]"
          },
          {
            source: {
              id: "business-insider",
              name: "Business Insider"
            },
            author: "Aaron McDade",
            title:
              "Tesla slammed with class-action lawsuit following report that employees internally shared private photos and videos taken from car cameras - Yahoo News",
            description:
              "The suit claims Tesla violated California's state constitution, privacy laws, and its own policies by allowing employees to allegedly access footage.",
            url:
              "https://www.businessinsider.com/tesla-class-action-lawsuit-employees-shared-private-car-camera-footage-2023-4",
            urlToImage:
              "https://s.yimg.com/ny/api/res/1.2/_ZGpLoXyi8p_fDGaree9Ow--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD05MDA-/https://media.zenfs.com/en/business_insider_articles_888/0c82eada8be27c91964d55ce5a3c66a8",
            publishedAt: "2023-04-08T16:31:03Z",
            content:
              "A Tesla car dealership in Maplewood, Minnesota.Michael Siluk/Getty Images\r\n<ul><li>Tesla is facing a new class-action lawsuit on behalf of anyone who owned or leased a Tesla since 2019.\r\n</li><li>The… [+2817 chars]"
          },
          {
            source: {
              id: nil,
              name: "Taipei Times"
            },
            author: "台北時報",
            title: "US dollar firms after jobs report release - 台北時報",
            description: "",
            url:
              "https://www.taipeitimes.com/News/biz/archives/2023/04/09/2003797565",
            urlToImage:
              "https://www.taipeitimes.com/images/2023/04/09/P10-230409-321.jpg",
            publishedAt: "2023-04-08T16:00:00Z",
            content:
              "US dollar firms after jobs report release\r\nThe US dollar strengthened on Friday after data showed an increase in jobs in the worlds largest economy last month, suggesting that the US Federal Reserve … [+2283 chars]"
          },
          {
            source: {
              id: nil,
              name: "Cointelegraph"
            },
            author: "Marco Castrovilli",
            title:
              "How will the Shanghai upgrade impact ETH price? Expert explains - Cointelegraph",
            description:
              "Ethereum researcher Vivek Raman discusses the significance of the upcoming Ethereum Shanghai upgrade and assesses its potential impact on the price of ETH.",
            url:
              "https://cointelegraph.com/news/how-will-the-shanghai-upgrade-impact-eth-price-expert-explains",
            urlToImage:
              "https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=1200/https://s3.cointelegraph.com/uploads/2023-04/88874f99-359c-42af-bdaf-0491eb0ba322.jpg",
            publishedAt: "2023-04-08T15:56:15Z",
            content:
              "While it may have some short-term negative impact on the price of Ether (ETH), the upcoming Shanghai upgrade will be extremely bullish for Ethereum's native token, as it will attract more capital to … [+1237 chars]"
          },
          {
            source: {
              id: nil,
              name: "fox8.com"
            },
            author: "Sarah Doiron, Michael Bartiromo",
            title:
              "Controversy surrounds Peeps candies ahead of Easter: Here’s what to know - WJW FOX 8 News Cleveland",
            description:
              "It’s peak Peep season, but the company that produces the candies is coming under fire from Consumer Reports for its use of a particular dye.",
            url:
              "https://fox8.com/news/controversy-surrounds-peeps-candies-ahead-of-easter-heres-what-to-know/",
            urlToImage:
              "https://fox8.com/wp-content/uploads/sites/12/2023/04/PeepsGettyImages-1480397867.jpg?w=1280",
            publishedAt: "2023-04-08T15:27:40Z",
            content:
              "EAST PROVIDENCE, R.I. (WPRI/NEXSTAR) It’s peak Peep season, but the company that produces the candies is coming under fire from Consumer Reports for its use of a particular dye.\r\nIn a press release i… [+3011 chars]"
          },
          {
            source: {
              id: nil,
              name: "KABC-TV"
            },
            author: nil,
            title:
              "McDonald's to lay off hundreds as burger giant restructures company, source says - KABC-TV",
            description:
              "\"There are more people that have been moved into new roles or promoted than have been laid off,\" the source said Friday.",
            url:
              "https://abc7.com/mcdonalds-layoffs-2023-mcdonalds-closing-offices-hq/13102804/",
            urlToImage:
              "https://cdn.abcotvs.com/dip/images/13077318_040323-wls-mcdonalds-layoffs-6avo-vid.jpg?w=1600",
            publishedAt: "2023-04-08T15:01:12Z",
            content:
              "NEW YORK -- Hundreds of people are being laid off from McDonald's as the burger giant restructures the company, a source familiar with the situation confirmed to ABC7 Friday.\r\nEarlier this week, the … [+1913 chars]"
          },
          {
            source: {
              id: nil,
              name: "CNBC"
            },
            author: "Cheryl Winokur Munk",
            title:
              "How green mortgages can help finance an energy-efficient home and save money - CNBC",
            description:
              "Green mortgage loans can help homebuyers finance energy efficiency upgrades including heating, windows and renewables, and make more use of climate incentives.",
            url:
              "https://www.cnbc.com/2023/04/08/green-mortgages-can-finance-an-energy-efficient-home-and-save-money.html",
            urlToImage:
              "https://image.cnbcfm.com/api/v1/image/107072101-16546087672022-06-06t184453z_672688149_rc2emu9p1n4c_rtrmadp_0_usa-biden-solar.jpeg?v=1680965086&w=1920&h=1080",
            publishedAt: "2023-04-08T14:44:46Z",
            content:
              "The residential real estate market has been volatile due to rising interest rates, but the peak spring season if challenging for buyers and sellers is here. For many potential homebuyers, a green mor… [+5570 chars]"
          }
        ]
      },
      entertainment: {
        status: "ok",
        totalResults: 67,
        articles: [
          {
            source: {
              id: nil,
              name: "Star Wars"
            },
            author: "StarWars.com Team",
            title:
              "SWCE 2023: Star Wars: Tales of the Jedi Season 2 Announced - Star Wars",
            description:
              "The animated series of shorts will return with new episodes.",
            url:
              "https://www.starwars.com/news/swce-2023-tales-of-the-jedi-season-2",
            urlToImage:
              "https://lumiere-a.akamaihd.net/v1/images/swce23-sw-tales-of-the-jedi-featured_0fa38a64.jpeg?region=0%2C130%2C1600%2C640",
            publishedAt: "2023-04-08T17:38:00Z",
            content:
              "Dave Filoni announced today at Star Wars Celebration Europe 2023 that Star Wars: Tales of the Jedi will return for a second season on Disney+. The news came as a surprise, but a welcome one, at the e… [+407 chars]"
          },
          {
            source: {
              id: nil,
              name: "Eonline.com"
            },
            author: "Corinne Heller",
            title:
              "Jeremy Renner Enjoys Family Trip to Six Flags Amusement Park 3 Months After Snowplow Accident - E! NEWS",
            description:
              "Jeremy Renner is up and about as he continues his recovery after being run over by a snow plow on New Year's Day. See photos from his family trip to Six Flags Magic Mountain Amusement Park.",
            url:
              "https://www.eonline.com/news/1370818/jeremy-renner-enjoys-family-trip-to-six-flags-amusement-park-3-months-after-snowplow-accident",
            urlToImage:
              "https://akns-images.eonline.com/eol_images/Entire_Site/202338/rs_600x600-230408092449-600-jeremy-renner-family-six-flags-instagram-cjh-040723.jpg?fit=around%7C1080:1080&output-quality=90&crop=1080:1080;center,top",
            publishedAt: "2023-04-08T16:31:00Z",
            content:
              "Jeremy Renner is back on his feet, as seen on a family trip to Six Flags Magic Mountain, as he continues his recovery from a near-fatal snowplow accident.\r\nThe Marvel star shared two group photos fro… [+755 chars]"
          },
          {
            source: {
              id: nil,
              name: "Nintendo Life"
            },
            author: "Liam Doolan",
            title:
              "Mario Movie Continues To Smash Global Box Office Records In Opening Weekend - Nintendo Life",
            description: "Mario time!",
            url:
              "https://www.nintendolife.com/news/2023/04/mario-movie-continues-to-smash-global-box-office-records-in-opening-weekend",
            urlToImage:
              "https://images.nintendolife.com/0912a5138c93e/1280x720.jpg",
            publishedAt: "2023-04-08T16:30:00Z",
            content:
              "Subscribe to Nintendo Life on YouTube\r\nWe're still in the early days of The Super Mario Bros. Movie, and so far it appears to be smashing it at the box office. In an update, the film is now projected… [+1296 chars]"
          },
          {
            source: {
              id: nil,
              name: "InStyle"
            },
            author: "https://www.facebook.com/InStyle",
            title:
              "Kate Middleton Reportedly Found Windsor Walkabout With Megan and Harry to Be \"One of the Hardest Things\" - InStyle",
            description:
              "A new book claims the photo-op was nothing but an \"illusion\" of unity.",
            url:
              "https://www.instyle.com/kate-middleton-windsor-walkabout-megan-harry-one-of-the-hardest-things-7377215",
            urlToImage:
              "https://www.instyle.com/thmb/BEmm14TQcoS3pOXBUTl_2PQy_fA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/kate-middleton-windsor-walkabout-harry-meghan-lead-e8c5c26465d64aafae2e91f887878682.jpg",
            publishedAt: "2023-04-08T16:10:39Z",
            content:
              "When Meghan Markle and Prince Harry joined Kate Middleton and Prince William to greet well-wishers outside Windsor Castle in the days following Queen Elizabeth's death last September, everyone was ho… [+1674 chars]"
          },
          {
            source: {
              id: nil,
              name: "New York Post"
            },
            author: "Angela Barbuti",
            title:
              "'The Bodyguard' musical stopped over 'mini riots,' rowdy audience members - New York Post ",
            description:
              "The musical “The Bodyguard” was cut short on Friday after rowdy behavior from audience members.",
            url:
              "https://nypost.com/2023/04/08/the-bodyguard-musical-stopped-for-rowdy-palace-theatre/",
            urlToImage:
              "https://nypost.com/wp-content/uploads/sites/2/2023/04/NYPICHPDPICT000009369525.jpg?quality=75&strip=all&w=1024",
            publishedAt: "2023-04-08T16:07:00Z",
            content:
              "A performance of the musical “The Bodyguard” was cut short in Manchester, England, on Friday thanks to rowdy behavior from audience members, according to BBC News.\r\nThe fracas erupted during the show… [+1412 chars]"
          },
          {
            source: {
              id: nil,
              name: "SheKnows"
            },
            author: "Delilah Gray",
            title:
              "New Photos of Megan Fox & Machine Gun Kelly Show Which Definitive Path Their Relationship Is Going In - Yahoo News",
            description:
              "It seems like we haven’t really gotten a clear glimpse as to what’s happening to Megan Fox and Machine Gun Kelly; that is, until now. It seems like every...",
            url:
              "https://www.sheknows.com/entertainment/articles/2749187/machine-gun-kelly-megan-fox-photos-reconciled/",
            urlToImage:
              "https://s.yimg.com/ny/api/res/1.2/yG6mATcVa7DA3Wh9BbiCAg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD05MDA-/https://media.zenfs.com/en/sheknows_79/2eb4391d2bceac0cafeff2ef8a3e1d3b",
            publishedAt: "2023-04-08T15:25:27Z",
            content:
              "If you purchase an independently reviewed product or service through a link on our website, SheKnows may receive an affiliate commission. \r\nIt seems like we havent really gotten a clear glimpse as to… [+2090 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Jack Black Talks About Love Songs and Bowser's Softer Side - IGN",
            description:
              "IGN got a chance to chat with Jack Black, who voices Bowser in The Super Mario Bros. Movie from Illumination and Nintendo, about taking on the role of the an...",
            url: "https://www.youtube.com/watch?v=t8XYvAlQXFc",
            urlToImage: "https://i.ytimg.com/vi/t8XYvAlQXFc/maxresdefault.jpg",
            publishedAt: "2023-04-08T15:00:29Z",
            content: nil
          },
          {
            source: {
              id: nil,
              name: "InStyle"
            },
            author: "https://www.facebook.com/InStyle",
            title:
              "Blake Lively's One-Piece Swimsuit Has a Midriff Cutout So Big, It's Basically a Bikini - InStyle",
            description: "The best of both worlds.",
            url:
              "https://www.instyle.com/blake-lively-black-cutout-swimsuit-instagram-7377207",
            urlToImage:
              "https://www.instyle.com/thmb/uqwEDziHNBsOiDvLG2ztPGqspTU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/blake-lively-cutout-swimsuit-instagram-lead-9eb7e947cf1c47798be7446f8b8d13a5.jpg",
            publishedAt: "2023-04-08T14:59:26Z",
            content:
              "Blake Lively is ready for her hot mom summer. Two months after welcoming her fourth child with husband Ryan Reynolds, the actress shared so many bikini photos from a recent tropical getaway on Instag… [+1537 chars]"
          },
          {
            source: {
              id: "buzzfeed",
              name: "Buzzfeed"
            },
            author: "Chelsea Stewart",
            title:
              "\"Love Is Blind\" Star Bartise Baby Announcement - BuzzFeed",
            description: "Did not have this one on my Bingo card.",
            url:
              "https://www.buzzfeed.com/chelseastewart/love-is-blind-bartise-baby-announcement",
            urlToImage:
              "https://img.buzzfeed.com/buzzfeed-static/static/2023-04/8/13/asset/42517ca7b2ab/sub-buzz-417-1680961749-1.jpg?crop=3000:1571;0,668%26downsize=1250:*",
            publishedAt: "2023-04-08T14:53:27Z",
            content: nil
          },
          {
            source: {
              id: nil,
              name: "NDTV News"
            },
            author: nil,
            title:
              "Brad Pitt Let His Neighbour Live Rent-Free For Years On His Former US Property - NDTV",
            description:
              "Brad Pitt's Los Angeles mansion was also home to his elderly neighbour who lived rent-free at his property for years.",
            url:
              "https://www.ndtv.com/feature/brad-pitt-let-his-neighbour-live-rent-free-for-years-on-his-former-us-property-3931784",
            urlToImage:
              "https://c.ndtvimg.com/2023-03/g72r9tk8_-brad-pitt_625x300_30_March_23.jpg",
            publishedAt: "2023-04-08T14:42:29Z",
            content:
              "The home is where Brad Pitt and Angelina Jolie raised their six children.\r\nBrad Pitt's Los Angeles mansion was also home to his elderly neighbour who lived rent-free at his property for years. Accord… [+2208 chars]"
          }
        ]
      },
      general: {
        status: "ok",
        totalResults: 36,
        articles: [
          {
            source: {
              id: nil,
              name: "Fox Business"
            },
            author: "Timothy Nerozzi",
            title:
              "Twitter-Substack feud heats up as Elon Musk is accused of censorship - Fox Business",
            description:
              "Elon Musk is denying accusations of censorship after severely throttling content from Twitter competitor Substack, claiming the company is \"trying to download a massive portion of the Twitter database.\"",
            url:
              "https://www.foxbusiness.com/technology/twitter-substack-feud-heats-up-elon-musk-accused-censorship",
            urlToImage:
              "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2023/03/0/0/GettyImages-1247308246.jpg?ve=1&tl=1",
            publishedAt: "2023-04-08T17:47:18Z",
            content:
              "Elon Musk is denying accusations of censorship after he took aggressive measures to restrict the use of a competing platform on Twitter.\r\nTwitter throttled the sharing of links to semi-competitor Sub… [+3058 chars]"
          },
          {
            source: {
              id: nil,
              name: "Yahoo Entertainment"
            },
            author: "Lily Rose",
            title:
              "Blake Lively sports a black bathing suit on vacation with her family: 'She sells seashells down by the seashore' - Yahoo Life",
            description:
              "The celeb shared family photos from her tropical getaway.",
            url:
              "https://www.yahoo.com/lifestyle/blake-lively-family-vacation-photos-with-ryan-reynolds-170954862.html",
            urlToImage:
              "https://s.yimg.com/ny/api/res/1.2/6WoJvzr3nst8V3fWvME81Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2022-05/b7bad990-cab5-11ec-b5dd-5b28a1774511",
            publishedAt: "2023-04-08T17:09:54Z",
            content:
              "Blake Lively shares photos from her family vacation. (Photo: Theo Wargo/WireImage)\r\nBlake Lively has shared family photos from her latest tropical vacation. The actress posted a beachy Instagram caro… [+2761 chars]"
          },
          {
            source: {
              id: "fox-news",
              name: "Fox News"
            },
            author: "Julia Musto",
            title:
              "Webb Telescope uncovers new details in stunning image of supernova remnant - Fox News",
            description:
              "NASA's James Webb Space Telescope has revealed new details in a supernova remnant created by a massive exploding star 11,000 light-years away in the constellation Cassiopeia.",
            url:
              "https://www.foxnews.com/science/webb-telescope-new-details-stunning-image-supernova-remnant",
            urlToImage:
              "https://static.foxnews.com/foxnews.com/content/uploads/2023/04/fe9151b9-THUMB.jpg",
            publishedAt: "2023-04-08T16:32:00Z",
            content:
              "A new image from NASA's James Webb Space Telescope shows a supernova remnant created by a massive exploding star. \r\nThe mid-infrared image shows the supernova remnant Cassiopeia A which was created b… [+1936 chars]"
          },
          {
            source: {
              id: nil,
              name: "Eonline.com"
            },
            author: "Corinne Heller",
            title:
              "Jeremy Renner Enjoys Family Trip to Six Flags Amusement Park 3 Months After Snowplow Accident - E! NEWS",
            description:
              "Jeremy Renner is up and about as he continues his recovery after being run over by a snow plow on New Year's Day. See photos from his family trip to Six Flags Magic Mountain Amusement Park.",
            url:
              "https://www.eonline.com/news/1370818/jeremy-renner-enjoys-family-trip-to-six-flags-amusement-park-3-months-after-snowplow-accident",
            urlToImage:
              "https://akns-images.eonline.com/eol_images/Entire_Site/202338/rs_600x600-230408092449-600-jeremy-renner-family-six-flags-instagram-cjh-040723.jpg?fit=around%7C1080:1080&output-quality=90&crop=1080:1080;center,top",
            publishedAt: "2023-04-08T16:31:00Z",
            content:
              "Jeremy Renner is back on his feet, as seen on a family trip to Six Flags Magic Mountain, as he continues his recovery from a near-fatal snowplow accident.\r\nThe Marvel star shared two group photos fro… [+755 chars]"
          },
          {
            source: {
              id: nil,
              name: "Nintendo Life"
            },
            author: "Liam Doolan",
            title:
              "Mario Movie Continues To Smash Global Box Office Records In Opening Weekend - Nintendo Life",
            description: "Mario time!",
            url:
              "https://www.nintendolife.com/news/2023/04/mario-movie-continues-to-smash-global-box-office-records-in-opening-weekend",
            urlToImage:
              "https://images.nintendolife.com/0912a5138c93e/1280x720.jpg",
            publishedAt: "2023-04-08T16:30:00Z",
            content:
              "Subscribe to Nintendo Life on YouTube\r\nWe're still in the early days of The Super Mario Bros. Movie, and so far it appears to be smashing it at the box office. In an update, the film is now projected… [+1296 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Tierney Sneed",
            title:
              "Rival rulings on medication abortion hypercharge the post-Roe legal war - CNN",
            description:
              "A pair of conflicting federal court rulings on Friday created arguably the most contentious and chaotic legal flashpoint over abortion access since the Supreme Court's ruling last summer that overturned Roe v. Wade and ended the right to an abortion nationwid…",
            url:
              "https://www.cnn.com/2023/04/08/politics/medication-abortion-texas-washington-fda/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230407153625-medical-abortion-mifepristone-file.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T16:16:00Z",
            content:
              "A pair of conflicting federal court rulings on Friday created arguably the most contentious and chaotic legal flashpoint over abortion access since the Supreme Courts ruling last summer that overturn… [+9118 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Aimee Lewis",
            title: "Tiger Woods makes the cut at The Masters - CNN",
            description:
              "It remained in the balance for much of the morning as to whether Tiger Woods would make the cut at The Masters but after a nervy wait the five-time champion made it through to the third and fourth rounds in Augusta.",
            url:
              "https://www.cnn.com/2023/04/08/golf/tiger-woods-masters-cut-spt-intl/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230408100439-01-masters-040823.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T16:16:00Z",
            content:
              "It remained in the balance for much of the morning as to whether Tiger Woods would make the cut at The Masters but after a nervy wait the five-time champion made it through to the third and fourth ro… [+2110 chars]"
          },
          {
            source: {
              id: nil,
              name: "BBC News"
            },
            author: "https://www.facebook.com/bbcnews",
            title:
              "Thabo Bester: 'Facebook rapist' who faked death arrested in Tanzania - BBC",
            description:
              "Thabo Bester, known as the \"Facebook rapist\", was at large for a year after escaping South African prison.",
            url: "https://www.bbc.com/news/world-africa-65221385",
            urlToImage:
              "https://ichef.bbci.co.uk/news/1024/branded_news/1806B/production/_129311489_gettyimages-129143970.jpg",
            publishedAt: "2023-04-08T15:58:08Z",
            content:
              "A rapist and murderer who escaped a South African prison by faking his own death has been arrested in Tanzania.\r\nThabo Bester was at large for a year after it was thought he died by setting himself o… [+1719 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Michelle Watson, Zoe Sottile",
            title:
              "'We need your help': $10,000 reward offered for tips that lead to arrest of third suspect in Florida triple homicide - CNN",
            description:
              "Officials are offering a total of $10,000 for information that leads to the arrest of 16-year-old Tahj Brewton, the third suspect sought in connection with the recent shooting deaths of three Florida teenagers.",
            url:
              "https://www.cnn.com/2023/04/08/us/reward-florida-teens-triple-homicide/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230408110030-tahj-brewton-reward-florida-teens-triple-homicide.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T15:26:00Z",
            content:
              "Officials are offering a total of $10,000 for information that leads to the arrest of 16-year-old Tahj Brewton, the third suspect sought in connection with the recent shooting deaths of three Florida… [+1798 chars]"
          },
          {
            source: {
              id: nil,
              name: "KABC-TV"
            },
            author: nil,
            title:
              "McDonald's layoffs 2023: Hundreds to be laid off as burger giant restructures company, source says - KABC-TV",
            description:
              "\"There are more people that have been moved into new roles or promoted than have been laid off,\" the source said Friday.",
            url:
              "https://abc7.com/mcdonalds-layoffs-2023-mcdonalds-closing-offices-hq/13102804/",
            urlToImage:
              "https://cdn.abcotvs.com/dip/images/13077318_040323-wls-mcdonalds-layoffs-6avo-vid.jpg?w=1600",
            publishedAt: "2023-04-08T15:01:12Z",
            content:
              "NEW YORK -- Hundreds of people are being laid off from McDonald's as the burger giant restructures the company, a source familiar with the situation confirmed to ABC7 Friday.\r\nEarlier this week, the … [+1913 chars]"
          }
        ]
      },
      health: {
        status: "ok",
        totalResults: 68,
        articles: [
          {
            source: {
              id: nil,
              name: "Daily Mail"
            },
            author: "Emily Joshu",
            title:
              "You'd need to consume 75 packets of Splenda a DAY to suffer health problems- so why all the fear? - Daily Mail",
            description:
              "You can consume up to 75 packets of sweetener a day to suffer lasting health consequences. However, it takes significantly less sugar to have even worse effects, such as heart disease (shown here).",
            url:
              "https://www.dailymail.co.uk/health/article-11950929/Youd-need-consume-75-packets-Splenda-DAY-suffer-health-problems-fear.html",
            urlToImage:
              "https://i.dailymail.co.uk/1s/2023/04/07/23/69605065-0-image-a-13_1680905692434.jpg",
            publishedAt: "2023-04-08T17:07:31Z",
            content:
              "There is no convincing evidence that artificial sweeteners are dangerous and you'd need to consume up to 75 packets per day before suffering health consequences, according to experts.\r\nIn recent year… [+6454 chars]"
          },
          {
            source: {
              id: nil,
              name: "New York Post"
            },
            author: "Brooke Kato",
            title:
              "Weight loss left me with 20 lbs of excess skin — I prefer being heavier - New York Post ",
            description:
              "“Now I don’t like looking in the mirror other than at my face. I don’t like my body at all. It’s horrendous,” Claudette Hawk shared.",
            url:
              "https://nypost.com/2023/04/08/weight-loss-left-me-with-20-lbs-of-excess-skin-i-prefer-being-heavier/",
            urlToImage:
              "https://nypost.com/wp-content/uploads/sites/2/2023/04/newspress-collage-26505339-1680969015938.jpg?quality=75&strip=all&1680958112&w=1024",
            publishedAt: "2023-04-08T16:55:00Z",
            content:
              "In losing weight, she lost herself.\r\nClaudette Hawk shed nearly half her body weight thanks to weight loss surgery, but she says she is now struggling with 20 pounds of excess skin that makes it diff… [+4440 chars]"
          },
          {
            source: {
              id: "cnn",
              name: "CNN"
            },
            author: "Paradise Afshar",
            title:
              "Tacoma woman with tuberculosis found in contempt of court after refusing treatment - CNN",
            description:
              "A Washington state woman who has refused to isolate or get treatment for tuberculosis for more than a year was found in contempt of court Friday.",
            url:
              "https://www.cnn.com/2023/04/08/us/tacoma-woman-tuberculosis-contempt/index.html",
            urlToImage:
              "https://media.cnn.com/api/v1/images/stellar/prod/230408102628-tuberculosis-illustration-cdc.jpg?c=16x9&q=w_800,c_fill",
            publishedAt: "2023-04-08T14:56:00Z",
            content:
              "A Washington state woman who has refused to isolate or get treatment for tuberculosis for more than a year was found in contempt of court Friday.\r\nLaw enforcement has the civil arrest warrant that au… [+1247 chars]"
          },
          {
            source: {
              id: nil,
              name: "Detroit Free Press"
            },
            author: "Keith Matheny",
            title:
              "Fungal infection outbreak affects 90+ workers at Escanaba paper mill - Detroit Free Press",
            description:
              "Serious health complications are uncommon but possible with blastomycosis, a rare fungal disease associated with moist soil and decomposing wood.",
            url:
              "https://www.freep.com/story/news/local/michigan/2023/04/08/fungal-infection-blastomycosis-escanaba-michigan-paper-mill/70092945007/",
            urlToImage:
              "https://www.gannett-cdn.com/presto/2023/04/07/PDTF/ed844eb7-ec17-41f7-a1bc-a6c29b5f5281-Escanaba_production_unit.jpeg?crop=4991,2808,x0,y253&width=3200&height=1801&format=pjpg&auto=webp",
            publishedAt: "2023-04-08T10:04:41Z",
            content:
              "More than 90 employees at an Upper Peninsula paper mill are believed infected with a fungus found in soil and decaying wood, with about a dozen requiring hospitalization.\r\nInvestigation of a blastomy… [+5459 chars]"
          },
          {
            source: {
              id: nil,
              name: "Slashdot.org"
            },
            author: nil,
            title:
              "Cancer and Heart Disease Vaccines 'Ready By End of the Decade' - Slashdot - Slashdot",
            description:
              "An anonymous reader quotes a report from the Guardian: Millions of lives could be saved by a groundbreaking set of new vaccines for a range of conditions including cancer, experts have said. A leading pharmaceutical firm said it is confident that jabs for can…",
            url:
              "https://science.slashdot.org/story/23/04/07/2125241/cancer-and-heart-disease-vaccines-ready-by-end-of-the-decade",
            urlToImage:
              "https://a.fsdn.com/sd/topics/medicine_64.png?refresh=now",
            publishedAt: "2023-04-08T03:44:30Z",
            content:
              "So suddenly nobody dies, and we get a good spike in people. Then we can't get enough food and/or water to all of them for this or that reason, and all hell breaks loose. With bad luck the riots break… [+2424 chars]"
          },
          {
            source: {
              id: nil,
              name: "SciTechDaily"
            },
            author: nil,
            title:
              "New Research Uncovers Potential Explanation for COVID Vaccine Blood Clot Connection - SciTechDaily",
            description:
              "Scientists identify key differences in immune responses to the AstraZeneca and Pfizer vaccines. A recent study conducted by a team from SAHMRI and Flinders University in Australia has revealed significant variations in the way the AstraZeneca and Pfizer COVID…",
            url:
              "https://scitechdaily.com/new-research-uncovers-potential-explanation-for-covid-vaccine-blood-clot-connection/",
            urlToImage:
              "https://scitechdaily.com/images/New-COVID-Vaccine-Illustration.jpg",
            publishedAt: "2023-04-08T02:15:43Z",
            content:
              "ByFlinders UniversityApril 7, 2023\r\nA recent Australian study discovered fundamental differences in immune responses between the AstraZeneca and Pfizer COVID-19 vaccines. The AstraZeneca vaccine elic… [+8388 chars]"
          },
          {
            source: {
              id: nil,
              name: "Slate Magazine"
            },
            author: "Meg Duff",
            title:
              "Paxlovid and long COVID: What the latest data says. - Slate",
            description: "More people should be aware of it.",
            url:
              "https://slate.com/technology/2023/04/paxlovid-long-covid-access-study.html",
            urlToImage:
              "https://compote.slate.com/images/43f1bb7b-8ad5-4206-a6d5-74e7e0f8a263.jpeg?crop=1560%2C1040%2Cx0%2Cy0&width=1560",
            publishedAt: "2023-04-08T01:51:00Z",
            content:
              "You probably know of Paxlovid as an antiviral drug that can help make COVID infections less severe. Now, a new study found that Paxlovid reduces the risk of long COVID as well. The study, out March 2… [+6958 chars]"
          },
          {
            source: {
              id: nil,
              name: "New York Post"
            },
            author: "Patrick Reilly",
            title:
              "2 babies born with brain damage after moms tested positive for COVID-19 during pregnancy, study reveals - New York Post ",
            description:
              "The babies did not test positive for the virus themselves, but had high levels of COVID antibodies in their blood, researchers said.",
            url:
              "https://nypost.com/2023/04/07/2-babies-born-brain-damaged-after-moms-got-covid-19-during-pregnancy-study/",
            urlToImage:
              "https://nypost.com/wp-content/uploads/sites/2/2023/04/newspress-collage-26501486-1680913623566.jpg?quality=75&strip=all&1680899815&w=1024",
            publishedAt: "2023-04-08T01:21:00Z",
            content:
              "The first confirmed cases of babies born with brain damage as a result of the COVID-19 virus crossing into their mothers placenta were revealed in a new study this week.\r\nBoth babies were born to you… [+2291 chars]"
          },
          {
            source: {
              id: nil,
              name: "Celebwell.com"
            },
            author: "Ferozan Mast",
            title:
              "Monami Ghosh in Bathing Suit Says \"When it Was Spring\" - Celebwell",
            description:
              "Indian Bengali actress Monami Ghosh is soaking up the sunshine, and she shared a series of pictures of herself posing in a bathing suit.",
            url:
              "https://celebwell.com/news-monami-ghosh-in-bathing-suit-says-when-it-was-spring/",
            urlToImage:
              "https://celebwell.com/wp-content/uploads/sites/2/2023/04/monami-ghosh.jpg?quality=82&strip=all",
            publishedAt: "2023-04-08T01:02:03Z",
            content:
              "Indian Bengali actress Monami Ghosh is soaking up the spring sunshine. Ghosh shared a series of pictures on her Instagram account, where she's posing in a bright bathing suit top and black skirt whil… [+2734 chars]"
          },
          {
            source: {
              id: nil,
              name: "Deseret News"
            },
            author: "Hannah McKinlay",
            title:
              "What is dense breast tissue? How serious is it? - Deseret News",
            description:
              "Half of women who receive their mammogram results learn that they have dense breasts, but many don’t know what to do next. Learn more.",
            url:
              "https://www.deseret.com/utah/2023/4/7/23640255/dense-breast-tissue-notification-additional-screening",
            urlToImage:
              "https://deseret.brightspotcdn.com/dims4/default/0d0e020/2147483647/strip/true/crop/3000x1713+0+152/resize/1461x834!/quality/90/?url=https%3A%2F%2Fcdn.vox-cdn.com%2Fthumbor%2FYRnudor7FBlSCkcMA1zPUtzAQhU%3D%2F0x0%3A3000x2221%2F3000x2221%2Ffilters%3Afocal%281420x1008%3A1421x1009%29%2Fcdn.vox-cdn.com%2Fuploads%2Fchorus_asset%2Ffile%2F24570066%2Fmerlin_2973239.jpg",
            publishedAt: "2023-04-08T00:50:00Z",
            content:
              "We are pleased to inform you that your recent mammogram shows no sign of cancer.\r\nThis sentence often elicits a sigh of relief from women reading their mammogram results, but about half of them will … [+5681 chars]"
          }
        ]
      },
      science: {
        status: "ok",
        totalResults: 61,
        articles: [
          {
            source: {
              id: "fox-news",
              name: "Fox News"
            },
            author: "Julia Musto",
            title:
              "Webb Telescope uncovers new details in stunning image of supernova remnant - Fox News",
            description:
              "NASA's James Webb Space Telescope has revealed new details in a supernova remnant created by a massive exploding star 11,000 light-years away in the constellation Cassiopeia.",
            url:
              "https://www.foxnews.com/science/webb-telescope-new-details-stunning-image-supernova-remnant",
            urlToImage:
              "https://static.foxnews.com/foxnews.com/content/uploads/2023/04/fe9151b9-THUMB.jpg",
            publishedAt: "2023-04-08T16:32:00Z",
            content:
              "A new image from NASA's James Webb Space Telescope shows a supernova remnant created by a massive exploding star. \r\nThe mid-infrared image shows the supernova remnant Cassiopeia A which was created b… [+1936 chars]"
          },
          {
            source: {
              id: "fox-news",
              name: "Fox News"
            },
            author: "Associated Press",
            title:
              "Study reveals how life survived on ‘Snowball Earth’ - Fox News",
            description:
              "A study revealed why life was likely able to survive the “Snowball Earth\" event, a period when the Earth was frozen over with runaway glaciation.",
            url:
              "https://www.foxnews.com/science/study-reveals-how-life-survived-snowball-earth",
            urlToImage:
              "https://static.foxnews.com/foxnews.com/content/uploads/2023/04/ice.jpg",
            publishedAt: "2023-04-08T15:00:00Z",
            content:
              "Life on our planet faced a stern test during the Cryogenian Period that lasted from 720 million to 635 million years ago when Earth twice was frozen over with runaway glaciation and looked from space… [+4147 chars]"
          },
          {
            source: {
              id: "ars-technica",
              name: "Ars Technica"
            },
            author: "Kenna Hughes-Castleberry",
            title:
              "We’re one step closer to reading an octopus’s mind - Ars Technica",
            description:
              "A recording device and electrodes were implanted in the very flexible cephalopods.",
            url:
              "https://arstechnica.com/science/2023/04/in-a-first-researchers-track-brain-activity-in-a-free-moving-octopus/",
            urlToImage:
              "https://cdn.arstechnica.net/wp-content/uploads/2023/04/GettyImages-1182219843-760x380.jpg",
            publishedAt: "2023-04-08T11:00:59Z",
            content:
              "3 with \r\nNine brains, blue blood, instant camouflage: Its no surprise that octopuses capture our interest and our imaginations. Science-fiction creators, in particular, have been inspired by these te… [+5747 chars]"
          },
          {
            source: {
              id: nil,
              name: "Space.com"
            },
            author: "Tereza Pultarova",
            title:
              "ESA's Jupiter mission JUICE is not 'strong enough' to orbit potentially life-harboring Europa. Here's why - Space.com",
            description:
              "JUICE has a \"nuclear bunker\" at its heart and needs as little power as a hair dryer. It still wouldn't survive for long at Europa.",
            url:
              "https://www.space.com/why-jupiter-juice-spacecraft-will-not-orbit-europa",
            urlToImage:
              "https://cdn.mos.cms.futurecdn.net/yWV8JirmRt6A7JBFv2koQQ-1200-80.jpg",
            publishedAt: "2023-04-08T10:00:18Z",
            content:
              "Europe's Jupiter Icy Moons Explorer (JUICE) spacecraft will set out on an ambitious explorative tour of Jupiter's moons next week. But the mission will only take the briefest glimpse of the potential… [+8673 chars]"
          },
          {
            source: {
              id: "usa-today",
              name: "USA Today"
            },
            author: "Stephen J. Beard",
            title:
              "NASA moon mission: See the new spacesuit prototype for Artemis III - USA TODAY",
            description:
              "Greater flexibility and better fit for varying body types drive the design of new spacesuits astronauts will wear when humans return to the moon.",
            url:
              "https://www.usatoday.com/in-depth/graphics/2023/04/08/spacesuit-artemis-moon-mission/11476895002/",
            urlToImage:
              "https://www.gannett-cdn.com/presto/2023/03/23/USAT/ea4caaa0-d217-402e-9572-c8144a2147ce-suitcomparepromo.jpg?crop=2795%2C1572%2Cx102%2Cy0&width=1200",
            publishedAt: "2023-04-08T10:00:03Z",
            content:
              "When humans return to the moon for the first time in more than 50 years, they'll do so wearing updated spacesuits with greater flexibility and range of motion, expanded research functionality and bet… [+1331 chars]"
          },
          {
            source: {
              id: nil,
              name: "Live Science"
            },
            author: "JoAnna Wendel",
            title:
              "What's the highest a mountain can grow on Earth? - Livescience.com",
            description:
              "Although a mountain could theoretically grow taller than Mount Everest, forces like gravity and erosion work against it.",
            url:
              "https://www.livescience.com/whats-the-highest-a-mountain-can-grow-on-earth",
            urlToImage:
              "https://cdn.mos.cms.futurecdn.net/FXi6kXgGVp3mTRabeGMG5P-1200-80.jpg",
            publishedAt: "2023-04-08T09:00:00Z",
            content:
              "Could a mountain grow to greater heights than Everest? (Image credit: sansubba)\r\nSixty million years ago, when the Eurasian plate slammed into the Indian plate, a mountain range was born. Because the… [+4133 chars]"
          },
          {
            source: {
              id: nil,
              name: "Unilad.com"
            },
            author: "Ella Scott",
            title:
              "The Moon is drifting away from Earth and it’s having a major impact on time - UNILAD",
            description:
              "Scientists have discovered that the Moon is drifting away from the Earth at a rapid pace, and it's having a serious impact on how long our days are.",
            url:
              "https://www.unilad.com/technology/moon-drifting-earth-changing-time-222827-20230408",
            urlToImage:
              "https://images.ladbible.com/resize?type=jpeg&quality=70&width=1200&fit=contain&gravity=auto&url=https://eu-images.contentstack.com/v3/assets/blt949ea8e16e463049/blt4e13681bda54ac21/64312b1adcc4f80194f4e196/moons.png",
            publishedAt: "2023-04-08T08:51:48Z",
            content:
              "Scientists have discovered that days on Earth are getting longer as the moon is slowly drifting away. \r\nIt has always been assumed that the Earths only natural satellite remained at a constant distan… [+2522 chars]"
          },
          {
            source: {
              id: nil,
              name: "indy100"
            },
            author: "Harry Fletcher",
            title:
              "A big dent in the Earth's magnetic field is making scientists nervous - indy100",
            description:
              "There’s a pretty hefty dent in the Earth's magnetic field and it’s giving scientists cause for concern. \nThe Earth’s magnetic field is vital for protecting the planet from the Sun’s rays, but an area of weakness in the field has been detected which is making …",
            url:
              "https://www.indy100.com/science-tech/big-dent-earth-magnetic-field-2659756518",
            urlToImage:
              "https://www.indy100.com/media-library/geophysicists-discover-new-magnetic-waves-moving-around-deep-inside-the-earth.png?id=33397842&width=1200&height=600&coordinates=0%2C132%2C0%2C68",
            publishedAt: "2023-04-08T07:26:27Z",
            content:
              "Theres a pretty hefty dent in the Earth's magnetic field and its giving scientists cause for concern. \r\nThe Earths magnetic field is vital for protecting the planet from the Suns rays, but an area of… [+1648 chars]"
          },
          {
            source: {
              id: nil,
              name: "indy100"
            },
            author: "Harry Fletcher",
            title:
              "Massive ocean discovered beneath the Earth's crust - indy100",
            description:
              "It feels like there have been staggering science stories emerging every other day recently, all of which have blown our tiny little minds.First, there was the discovery of a terrifying black hole pointing right at us, then there was a huge hole found in the s…",
            url:
              "https://www.indy100.com/science-tech/ocean-beneath-earth-crust-ringwoodite-2659756515",
            urlToImage:
              "https://www.indy100.com/media-library/is-earth-imploding-beneath-the-ocean-unexplained-sinkholes-unveiled.jpg?id=33372289&width=1200&height=600&coordinates=0%2C173%2C0%2C173",
            publishedAt: "2023-04-08T07:23:40Z",
            content:
              "It feels like there have been staggering science stories emerging every other day recently, all of which have blown our tiny little minds.\r\nFirst, there was the discovery of a terrifying black hole p… [+1949 chars]"
          },
          {
            source: {
              id: nil,
              name: "ScienceAlert"
            },
            author: "Mike McRae",
            title:
              "Astronomers May Have Detected a Hypothetical 'Strange Star' in Space - ScienceAlert",
            description:
              "With a mass of around three-quarters of our Sun crammed into a ball that could sit comfortably inside Manhattan, the compact object XMMU J173203.3-344518 is certainly remarkable.",
            url:
              "https://www.sciencealert.com/astronomers-may-have-detected-a-hypothetical-strange-star-in-space",
            urlToImage:
              "https://www.sciencealert.com/images/2023/03/quark_strang_star_artist_rep.jpg",
            publishedAt: "2023-04-08T06:01:11Z",
            content:
              "With a mass of around three-quarters of our Sun crammed into a ball that could sit comfortably inside Manhattan, the compact object XMMU J173203.3-344518 is certainly remarkable. Weird, even. Maybe b… [+4350 chars]"
          }
        ]
      },
      sports: {
        status: "ok",
        totalResults: 69,
        articles: [
          {
            source: {
              id: nil,
              name: "ESPN"
            },
            author: "Tim MacMahon",
            title:
              "Sources - Grizzlies' Steven Adams (knee) likely to miss postseason - ESPN",
            description:
              "Memphis Grizzlies center Steven Adams, who has not played since January due to a knee injury, is likely to miss the postseason, sources told ESPN's Adrian Wojnarowski.",
            url:
              "https://www.espn.com/nba/story/_/id/36120081/sources-grizzlies-steven-adams-knee-likely-miss-postseason",
            urlToImage:
              "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0309%2Fr1141904_1296x729_16%2D9.jpg",
            publishedAt: "2023-04-08T18:13:25Z",
            content:
              "Memphis Grizzlies center Steven Adams is likely to miss the postseason with his injured right knee, sources told ESPN's Adrian Wojnarowski.\r\nAdams, who underwent a stem cell injection about a month a… [+1310 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Brentford v. Newcastle United | PREMIER LEAGUE HIGHLIGHTS | 4/8/2023 | NBC Sports - NBC Sports",
            description: nil,
            url: "https://www.youtube.com/watch?v=LmgZ1fQnoTo",
            urlToImage: nil,
            publishedAt: "2023-04-08T17:53:55Z",
            content:
              "Your browser isnt supported anymore. Update it to get the best YouTube experience and our latest features. Learn more\r\nRemind me later"
          },
          {
            source: {
              id: nil,
              name: "U.S. Soccer"
            },
            author: nil,
            title:
              "International Friendly presented by Truly Hard Seltzer: USA vs. Republic of Ireland - Lineup, Schedule & TV Channels | U.S. Soccer Official Website - U.S. Soccer",
            description:
              "Q2 Stadium; Austin, Texas; Broadcast: TNT, Universo and Peacock; Broadcast Time: 2:30 p.m. ET / 1:30 p.m. Local (Pre-game coverage begins at 2 p.m. ET / 1 p.m. CT on TNT); Official Kickoff Time: 2:37 p.m. ET / 1:37 p.m. Local",
            url:
              "https://www.ussoccer.com/stories/2023/04/intl-friendly-presented-by-truly-uswnt-vs-irl-starting-xi-lineup-notes-tv-channels-start-time",
            urlToImage:
              "https://cdn.ussoccer.com/-/media/project/ussf/2023-article-images/wntusa-vs-irlapr8lineup-notes16x9jpg.ashx?h=1080&la=en-US&w=1920&rev=5a375fee549246b3baa05dafeccba7b5&hash=F4203597F813D590883E3D0AB53506A2",
            publishedAt: "2023-04-08T17:44:12Z",
            content:
              "Date: April 8, 2023Venue: Q2 Stadium; Austin, TexasBroadcast: TNT, Universo and Peacock Broadcast Time: 2:30 p.m. ET / 1:30 p.m. Local (Pre-game coverage begins at 2 p.m. ET / 1 p.m. CT on TNT)Offici… [+6816 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Tottenham Hotspur v. Brighton | PREMIER LEAGUE HIGHLIGHTS | 4/8/2023 | NBC Sports - NBC Sports",
            description: nil,
            url: "https://www.youtube.com/watch?v=x8DRxNWt27U",
            urlToImage: nil,
            publishedAt: "2023-04-08T17:22:00Z",
            content:
              "Your browser isnt supported anymore. Update it to get the best YouTube experience and our latest features. Learn more\r\nRemind me later"
          },
          {
            source: {
              id: nil,
              name: "NBCSports.com"
            },
            author: "Dustin Long",
            title:
              "Sunday Cup dirt race at Bristol: Start time, TV info, weather - NASCAR on NBC Sports",
            description:
              "All the details for Sunday night's Cup race on the dirt at Bristol.",
            url:
              "https://nascar.nbcsports.com/2023/04/08/sunday-cup-race-at-bristol-start-time-tv-info-weather-kyle-busch-joey-logano-tyler-reddick-chase-briscoe/",
            urlToImage:
              "https://nascar.nbcsports.com/wp-content/uploads/sites/9/2023/04/GettyImages-1392061803-e1680973983386.jpg",
            publishedAt: "2023-04-08T17:14:00Z",
            content:
              "Denny Hamlin sees a day not far in the future when a crew chief doesnt go to the track but calls the race from the teams race shop. Brad Keselowski says such a moment would just be a part of the spor… [+12545 chars]"
          },
          {
            source: {
              id: nil,
              name: "Mavs Moneyball"
            },
            author: "Ben Zajdel",
            title:
              "Mavericks fear Doncic could consider requesting trade next summer, sources tell ESPN - Mavs Moneyball ",
            description:
              "The Dallas Mavericks are concerned Doncic could ask for a trade as early as next summer.",
            url:
              "https://www.mavsmoneyball.com/2023/4/8/23675346/mavericks-fear-doncic-could-consider-requesting-trade-next-summer-sources-espn",
            urlToImage:
              "https://cdn.vox-cdn.com/thumbor/deEAFI_hjw-oAffunlqmikk2G7M=/0x0:5395x2825/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/24571068/1480684117.jpg",
            publishedAt: "2023-04-08T17:00:00Z",
            content:
              "The Dallas Mavericks strange and disappointing season is drawing to a close. They still have one game to play, but a loss against the Chicago Bulls Friday officially eliminated them from any postseas… [+1779 chars]"
          },
          {
            source: {
              id: nil,
              name: "New York Post"
            },
            author: "Mark W. Sanchez",
            title:
              "Yankees' Josh Donaldson, Jonathan Loaisiga head to injured list in wave of roster moves - New York Post ",
            description:
              "The Yankees announced a slew of roster moves that included their infield taking an expected hit and their bullpen absorbing an unexpected setback.",
            url:
              "https://nypost.com/2023/04/08/josh-donaldson-jonathan-loaisiga-put-on-yankees-injured-list/",
            urlToImage:
              "https://nypost.com/wp-content/uploads/sites/2/2023/04/newspress-collage-26506218-1680972416878.jpg?quality=75&strip=all&1680958168&w=1024",
            publishedAt: "2023-04-08T16:50:00Z",
            content:
              "BALTIMORE The Yankees announced a slew of roster moves that included their infield taking an expected hit and their bullpen absorbing an unexpected setback.\r\nBefore Saturdays game against the Orioles… [+1844 chars]"
          },
          {
            source: {
              id: nil,
              name: "pgatour.com"
            },
            author: "Kevin Prise",
            title:
              "Fred Couples, 63, becomes oldest to make Masters cut - PGA TOUR - PGA TOUR",
            description:
              "Breaks Bernhard Langer’s record, advances to third round at Augusta National",
            url:
              "https://www.pgatour.com/article/news/latest/2023/04/08/fred-couples-63-becomes-oldest-to-make-masters-cut-augusta-national-bernhard-langer",
            urlToImage:
              "https://res.cloudinary.com/pgatour-prod/w_1200,h_628,c_fill,f_auto/pgatour/news/editorial/2023/04/08/couplesmastershattip.jpg",
            publishedAt: "2023-04-08T16:47:58Z",
            content:
              "Breaks Bernhard Langers record, advances to third round at Augusta National\r\nAs Fred Couples chased a Masters record that indicates generational longevity, it was fitting that he waited until Saturda… [+2663 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Ollie Watkins seals Aston Villa win v. Nottingham Forest | Premier League | NBC Sports - NBC Sports",
            description:
              "Ollie Watkins scores with almost the final kick of the game to put the cherry on top of Aston Villa's triumph against Nottingham Forest. #NBCSports #PremierL...",
            url: "https://www.youtube.com/watch?v=mDluh7VTZgc",
            urlToImage: "https://i.ytimg.com/vi/mDluh7VTZgc/maxresdefault.jpg",
            publishedAt: "2023-04-08T16:35:28Z",
            content: nil
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Highlights: 2023 Paris-Roubaix Femmes avec Zwift - FloBikes",
            description: nil,
            url: "https://www.youtube.com/watch?v=YaTiKCxmOjI",
            urlToImage: nil,
            publishedAt: "2023-04-08T16:34:23Z",
            content:
              "Your browser isnt supported anymore. Update it to get the best YouTube experience and our latest features. Learn more\r\nRemind me later"
          }
        ]
      },
      technology: {
        status: "ok",
        totalResults: 67,
        articles: [
          {
            source: {
              id: nil,
              name: "ComicBook.com"
            },
            author: "ComicBook.com",
            title: "PS5 Freebie Saves PlayStation Fans $42 - ComicBook.com",
            description: nil,
            url:
              "https://comicbook.com/gaming/news/ps5-playstation-5-freebie-apple/",
            urlToImage: nil,
            publishedAt: "2023-04-08T16:58:00Z",
            content: nil
          },
          {
            source: {
              id: nil,
              name: "HODINKEE"
            },
            author: "Mark Hackman",
            title:
              "Pre-Owned Picks Neo-Vintage Watches With Staying Power - HODINKEE",
            description:
              "Five watches from the Hodinkee Shop that are old enough to drink.",
            url:
              "https://www.hodinkee.com/articles/pre-owned-picks-neo-vintage-watches-with-staying-power",
            urlToImage:
              "https://hodinkee.imgix.net/uploads/images/9c44beef-54d2-4127-a6ec-b4caecb67163/OMEGA-Speedmaster-Broad-Arrow-3594-50-00-10-10-OME-QGEAKD-ff156b202b9b_2048x2048.jpg?ixlib=rails-1.1.0&fm=jpg&q=55&auto=format&usm=12&w=1200&h=630&fit=crop",
            publishedAt: "2023-04-08T15:00:24Z",
            content:
              "Coke Vs Pepsi isn't a choice for current consumers of the current Rolex GMT-Master II. This black and red bezel combination has yet to make it to the modern age of ceramic bezels despite the populari… [+773 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Why Patan Patola Saris Are So Expensive | So Expensive | Insider Business - Insider Business",
            description:
              "Patan patola saris range from $1,500 to $8,500. Instead of designs being embroidered onto the textile, Patan patola requires them to be dyed onto the silk th...",
            url: "https://www.youtube.com/watch?v=SlSoZsbuD-Y",
            urlToImage: "https://i.ytimg.com/vi/SlSoZsbuD-Y/maxresdefault.jpg",
            publishedAt: "2023-04-08T15:00:21Z",
            content: nil
          },
          {
            source: {
              id: "the-verge",
              name: "The Verge"
            },
            author: "Sheena Vasani",
            title:
              "Apple's latest AirPods Pro have hit their all-time low at Amazon - The Verge",
            description:
              "You can buy Apple’s second-gen AirPods Pro for their best price to date right now. We also found deals on the Ring Video Doorbell Pro 2, Samsung’s Galaxy Watch 5, and both the ninth and 10th-gen Apple iPad.",
            url:
              "https://www.theverge.com/2023/4/8/23674577/apple-airpods-pro-ring-video-doorbell-pro-2-apple-ipad-amazon-kindle-deal-sale",
            urlToImage:
              "https://cdn.vox-cdn.com/thumbor/b44n0Mqjwg0qAHgjpkcX41l48_g=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/24040656/226285_AIRPODS_PRO_2_cwelch_0012.jpg",
            publishedAt: "2023-04-08T14:07:43Z",
            content:
              "Apples latest AirPods Pro have hit their all-time low at Amazon\r\nApples latest AirPods Pro have hit their all-time low at Amazon\r\n / Plus, we found deals on the terrific Ring Video Doorbell Pro 2, Sa… [+6323 chars]"
          },
          {
            source: {
              id: nil,
              name: "YouTube"
            },
            author: nil,
            title:
              "Firearms Expert Reacts To Resident Evil 4 (2023)'s Guns PART 2 - GameSpot",
            description:
              "Jonathan Ferguson, a weapons expert and Keeper of Firearms & Artillery at the Royal Armouries, breaks down more of the weaponry of the remake of Resident Evi...",
            url: "https://www.youtube.com/watch?v=7A8J2lCeruA",
            urlToImage: "https://i.ytimg.com/vi/7A8J2lCeruA/maxresdefault.jpg",
            publishedAt: "2023-04-08T14:00:04Z",
            content: nil
          },
          {
            source: {
              id: nil,
              name: "Wccftech"
            },
            author: "Hassan Mujtaba",
            title:
              "NVIDIA GeForce RTX 50 “Blackwell” GPU Rumors: 3nm Monolithic, Faster Clocks, Over 2x Faster Than Ada RTX 40 - Wccftech",
            description:
              "NVIDIA's next-gen GeForce RTX 50 series graphics cards are expected to utilize the new Blackwell GPU architecture.",
            url:
              "https://wccftech.com/nvidia-geforce-rtx-50-blackwell-gpu-rumors-3nm-monolithic-faster-clocks-over-2x-faster-than-ada-rtx-40/",
            urlToImage:
              "https://cdn.wccftech.com/wp-content/uploads/2022/10/DSC_0187-Custom-scaled.jpg",
            publishedAt: "2023-04-08T14:00:00Z",
            content:
              "NVIDIA's next-gen GeForce RTX 50 series graphics cards are expected to utilize the new Blackwell GPU architecture. Recently, there are lots of rumors popping up regarding the chip so we decided to ro… [+6592 chars]"
          },
          {
            source: {
              id: nil,
              name: "Android Authority"
            },
            author: nil,
            title:
              "What Bluetooth audio gear does Team Authority use daily? - Android Authority",
            description:
              "From Apple to Samsung and beyond, here is the Bluetooth audio gear (earbuds and headphones) that we use daily at Android Authority.",
            url:
              "https://www.androidauthority.com/bluetooth-audio-daily-team-aa-3265793/",
            urlToImage:
              "https://www.androidauthority.com/wp-content/uploads/2022/09/Sony-WH-1000MX3-Bluetooth-pairing.jpg",
            publishedAt: "2023-04-08T13:51:39Z",
            content:
              "We mostly focus on smartphones here at Android Authority, but there are plenty of other categories we cover as well. Bluetooth audio is one of these categories, with our sister website SoundGuys comp… [+5557 chars]"
          },
          {
            source: {
              id: nil,
              name: "MacRumors"
            },
            author: "MacRumors Staff",
            title:
              "Top Stories: iOS 17 and watchOS 10 Rumors, When to Expect a New iMac, and More - MacRumors",
            description:
              "WWDC is now just two months away, and we're starting to hear a bit more about what we might see with upcoming iOS 17 and watchOS 10 updates that...",
            url:
              "https://www.macrumors.com/2023/04/08/top-stories-ios-17-watchos-10-rumors/",
            urlToImage:
              "https://images.macrumors.com/t/0v6rR6VqVq6JRGH-t2VBONRUGUc=/1600x/article-new/2023/04/top-stories-8apr2023.jpg",
            publishedAt: "2023-04-08T13:00:00Z",
            content:
              "WWDC is now just two months away, and we're starting to hear a bit more about what we might see with upcoming iOS 17 and watchOS 10 updates that should be unveiled during the keynote.\r\nThis week also… [+3786 chars]"
          },
          {
            source: {
              id: nil,
              name: "AppleInsider"
            },
            author: "Malcolm Owen",
            title:
              "Leaked iPhone 15 Pro Max glass shows extremely thin bezels - AppleInsider",
            description:
              "The supposed world's thinnest bezels of the iPhone 15 Pro Max have surfaced in leaked images, with glass showing the bezel has undergone a diet from its iPhone 14 Pro counterpart.",
            url:
              "https://appleinsider.com/articles/23/04/08/leaked-iphone-15-pro-max-glass-shows-extremely-thin-bezels",
            urlToImage:
              "https://photos5.appleinsider.com/gallery/53870-108380-front-glass-ice-universe-xl.jpg",
            publishedAt: "2023-04-08T12:52:53Z",
            content:
              "[Ice Universe/Twitter]\r\nAppleInsider may earn an affiliate commission on purchases made through links on our site.\r\nThe supposed world's thinnest bezels of the iPhone 15 Pro Max have surfaced in leak… [+1523 chars]"
          },
          {
            source: {
              id: nil,
              name: "Boing Boing"
            },
            author: nil,
            title:
              "This light pole covered in an overgrown plant looks like an evil spirit - Boing Boing",
            description:
              "Whoever had the smart idea to shine  two lights on the plant and give it creepy glowing “eyes” is awesome. Imagine walking down the street in the dead of night and seeing this wicked silhouette. Th…",
            url:
              "https://boingboing.net/2023/04/08/this-light-pole-covered-in-an-overgrown-plant-looks-like-an-evil-spirit.html",
            urlToImage:
              "https://i0.wp.com/boingboing.net/wp-content/uploads/2023/04/shutterstock_1490215424-1.jpg?fit=1200%2C798&ssl=1",
            publishedAt: "2023-04-08T12:38:23Z",
            content: nil
          }
        ]
      },
      "close-socket": true
    }
  end
end
